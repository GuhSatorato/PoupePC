import sqlite3
from sqlite3 import Error

def create_connection():
    """ Cria uma conexão com o banco de dados SQLite """
    conn = None
    try:
        # O arquivo poupe_pc.db será criado na raiz do projeto backend
        conn = sqlite3.connect('poupe_pc.db')
        return conn
    except Error as e:
        print(f"Erro ao conectar: {e}")
    return conn

def init_db():
    """ Inicializa as tabelas do sistema """
    conn = create_connection()
    if conn is not None:
        cursor = conn.cursor()
        
        # 1. Tabela de Usuários
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            senha TEXT NOT NULL,
            data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
        );
        """)

        # 2. Tabela de Categorias
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS categorias (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            slug TEXT NOT NULL UNIQUE,
            icon TEXT
        );
        """)

        # 3. Tabela de Lojas Monitoradas
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS lojas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL UNIQUE,
            logo TEXT
        );
        """)

        # 4. Tabela de Produtos com Comparação de Preços
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            imagem TEXT,
            preco_menor REAL NOT NULL,
            preco_maior REAL NOT NULL,
            melhor_loja TEXT,
            desconto_percent INTEGER DEFAULT 0,
            categoria_id INTEGER,
            FOREIGN KEY (categoria_id) REFERENCES categorias(id)
        );
        """)
        
        conn.commit()
        
        # Insere dados de teste automáticos para a apresentação
        popular_dados_teste(cursor)
        
        conn.commit()
        conn.close()
        print("Banco de dados PoupePC inicializado com sucesso!")

def popular_dados_teste(cursor):
    """ Insere componentes de hardware para o site ter conteúdo nos testes """
    # Inserir Categorias
    cursor.execute("INSERT OR IGNORE INTO categorias (id, nome, slug, icon) VALUES (1, 'Processadores', 'processadores', 'cpu')")
    cursor.execute("INSERT OR IGNORE INTO categorias (id, nome, slug, icon) VALUES (2, 'Placas de Vídeo', 'placas-de-video', 'gpu')")
    
    # Inserir Lojas
    cursor.execute("INSERT OR IGNORE INTO lojas (id, nome, logo) VALUES (1, 'Kabum', 'kabum.png')")
    cursor.execute("INSERT OR IGNORE INTO lojas (id, nome, logo) VALUES (2, 'Pichau', 'pichau.png')")
    
    # Inserir Produtos de Exemplo
    cursor.execute("""
    INSERT OR IGNORE INTO produtos (id, nome, imagem, preco_menor, preco_maior, melhor_loja, desconto_percent, categoria_id) 
    VALUES (1, 'AMD Ryzen 7 5700X3D', 'ryzen7.jpg', 1199.00, 1450.00, 'Kabum', 17, 1)
    """)
    cursor.execute("""
    INSERT OR IGNORE INTO produtos (id, nome, imagem, preco_menor, preco_maior, melhor_loja, desconto_percent, categoria_id) 
    VALUES (2, 'NVIDIA RTX 5060 Ti', 'rtx5060ti.jpg', 2499.00, 2899.00, 'Pichau', 14, 2)
    """)

def cadastrar_usuario(nome, email, senha):
    conn = create_connection()
    try:
        cursor = conn.cursor()
        sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)"
        cursor.execute(sql, (nome, email, senha))
        conn.commit()
        return True
    except sqlite3.IntegrityError:
        print("Erro: Este e-mail já está cadastrado.")
        return False
    finally:
        conn.close()

def verificar_login(email, senha):
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM usuarios WHERE email = ? AND senha = ?", (email, senha))
    usuario = cursor.fetchone()
    conn.close()
    return usuario

def buscar_dados_home():
    """ Consulta única de alta performance que junta tudo para a Home do site """
    conn = create_connection()
    cursor = conn.cursor()
    
    cursor.execute("SELECT id, nome, slug, icon FROM categorias")
    categorias = [{"id": r[0], "name": r[1], "slug": r[2], "icon": r[3]} for r in cursor.fetchall()]
    
    cursor.execute("SELECT id, nome, logo FROM lojas")
    lojas = [{"id": r[0], "name": r[1], "logo": r[2]} for r in cursor.fetchall()]
    
    cursor.execute("SELECT id, nome, imagem, preco_menor, preco_maior, melhor_loja, desconto_percent FROM produtos LIMIT 6")
    produtos = [{
        "id": r[0], "name": r[1], "image": r[2], 
        "lowest_price": r[3], "highest_price": r[4], 
        "best_store": r[5], "discount_percent": r[6]
    } for r in cursor.fetchall()]
    
    conn.close()
    return {"categories": categorias, "stores": lojas, "featured_deals": produtos}

if __name__ == '__main__':
    init_db()