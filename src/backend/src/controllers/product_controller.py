# src/backend/src/controllers/product_controller.py
from fastapi import HTTPException, Query
from typing import Optional
from src.models.schemas import UsuarioCadastro, UsuarioLogin
from src.config.database import cadastrar_usuario, verificar_login

async def registrar(usuario: UsuarioCadastro):
    sucesso = cadastrar_usuario(usuario.nome, usuario.email, usuario.senha)
    if not sucesso:
        raise HTTPException(status_code=400, detail="Este e-mail já se encontra cadastrado.")
    return {"status": "success", "message": "Usuário cadastrado com sucesso!"}

async def login(credentials: UsuarioLogin):
    usuario_valido = verificar_login(credentials.email, credentials.senha)
    if not usuario_valido:
        raise HTTPException(status_code=401, detail="E-mail ou senha incorretos.")
    return {
        "status": "success",
        "message": "Login efetuado com sucesso!",
        "user": {
            "id": usuario_valido[0],
            "nome": usuario_valido[1],
            "email": usuario_valido[2]
        }
    }

async def search_products(
    query: Optional[str] = Query(None, min_length=2),
    category: Optional[str] = Query(None)
):
    if not query and not category:
        raise HTTPException(status_code=400, detail="Forneça um termo de busca ou categoria.")
    
    results = [{"id": 1, "name": f"Resultado para: {query}" if query else "Hardware", "price": 1199.00, "store": "Kabum"}]
    return {"status": "success", "results_count": len(results), "data": results}