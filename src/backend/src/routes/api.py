# src/backend/src/routes/api.py
from fastapi import APIRouter
from src.controllers.home_controller import get_home_data
from src.controllers.product_controller import registrar, login, search_products

api_router = APIRouter()

api_router.get("/home", summary="Bootstrap inicial do site")(get_home_data)
api_router.get("/products/search", summary="Busca avançada de produtos")(search_products)
api_router.post("/auth/register", status_code=201, summary="Formulário de Registro")(registrar)
api_router.post("/auth/login", status_code=200, summary="Formulário de Login")(login)