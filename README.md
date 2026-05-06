# 🖥️ PoupePC

> **Plataforma de pesquisa e comparação de preços de peças de informática**, oferecendo aos usuários a capacidade de encontrar os melhores preços para componentes como placas de vídeo, processadores, memórias RAM e muito mais, em diversas lojas online.

---

## 📖 Sobre o Projeto

O **PoupePC** é um projeto acadêmico desenvolvido para as disciplinas de **ADS** e **Desenvolvimento para Dispositivos Móveis**. A plataforma centraliza a comparação de preços de componentes de hardware entre as principais lojas do Brasil (Kabum, Pichau, Terabyte), ajudando gamers e entusiastas a montar seu PC com o melhor custo-benefício.

### 🎯 Objetivo

Simplificar a montagem de computadores, automatizando a comparação de preços e garantindo que o usuário finalize sua configuração com o maior nível de economia possível.

---

## 🛠️ Tecnologias Utilizadas

| Camada | Tecnologia |
|--------|-----------|
| **Back-End** | Python 3 |
| **Banco de Dados** | SQLite |
| **Front-End Mobile** | Flutter / Dart |
| **Front-End Web** | HTML, CSS, JavaScript |
| **Versionamento** | Git & GitHub |

---

## 📁 Estrutura do Projeto

```
PoupePC/
├── src/
│   ├── backend/              # Lógica Python e gerenciamento do banco de dados
│   │   ├── database_manager.py
│   │   └── db/
│   └── frontend/             # Aplicação Flutter (Web e Mobile)
│       ├── lib/
│       ├── android/
│       ├── ios/
│       ├── web/
│       └── pubspec.yaml
├── docs/
│   ├── planning/             # Planejamento do projeto
│   │   ├── backlog.md
│   │   ├── roadmap.md
│   │   └── project-vision.md
│   ├── workflow/             # Fluxo de trabalho da equipe
│   │   ├── development-vs-production.md
│   │   ├── team-organization.md
│   │   ├── kanban.md
│   │   └── gantt.md
│   └── evidences/            # Prints e evidências do processo
│       └── version-control/
├── .gitignore
└── README.md
```

---

## 🚀 Como Rodar o Projeto

### Pré-requisitos

- **Python 3.8+** instalado
- **Flutter SDK** (para o front-end mobile)
- **Git** para versionamento

### Back-End (Python + SQLite)

```bash
# 1. Clone o repositório
git clone https://github.com/gabrielportella989/PoupePC.git
cd PoupePC

# 2. Instale as dependências
pip install -r requirements.txt

# 3. Inicialize o banco de dados
python src/backend/database_manager.py
```

### Front-End (Flutter)

```bash
# 1. Entre na pasta do frontend
cd src/frontend

# 2. Instale as dependências do Flutter
flutter pub get

# 3. Execute a aplicação
flutter run
```

---

## 👥 Equipe

| Nome | Função | Responsabilidade |
|------|--------|-----------------|
| **Erick Hayashi C. de Freitas** | Líder / Documentação | Gestão do projeto e documentação técnica e acadêmica |
| **Gustavo Henrique Satorato** | Banco de Dados | SQLite/MySQL — persistência e segurança dos dados |
| **Miqueias Souza da Silva** | Back-End | Lógica em Python e integração com o banco de dados |
| **Eric Augusto Juliani** | Front-End | Código funcional em Flutter/Web |
| **Gabriel da Silva Portella** | UI/UX Design | Prototipação de alta fidelidade das interfaces |

---

## 🔀 Fluxo de Desenvolvimento

Utilizamos uma adaptação do modelo **Git Flow**:

- **`main`** → Código estável de produção (entregas oficiais)
- **`develop`** → Branch de integração para desenvolvimento
- **`feature/*`** → Branches temporárias para funcionalidades específicas

> Para mais detalhes, consulte: [Desenvolvimento vs Produção](docs/workflow/development-vs-production.md)

---

## 📋 Documentação Completa

| Documento | Descrição |
|-----------|-----------|
| [Visão do Projeto](docs/planning/project-vision.md) | Objetivo, problema, público-alvo e diferenciais |
| [Backlog do Produto](docs/planning/backlog.md) | Lista priorizada de funcionalidades |
| [Roadmap](docs/planning/roadmap.md) | Cronograma de fases do projeto |
| [Dev vs Produção](docs/workflow/development-vs-production.md) | Estratégia de branches e ambientes |
| [Organização da Equipe](docs/workflow/team-organization.md) | Papéis e responsabilidades |
| [Quadro Kanban](docs/workflow/kanban.md) | Acompanhamento das tarefas |
| [Gráfico de Gantt](docs/workflow/gantt.md) | Cronograma detalhado por sprint |

---

## 📝 Licença

Este projeto é desenvolvido para fins acadêmicos — **ADS / Desenvolvimento para Dispositivos Móveis**.
