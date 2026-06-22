# src/backend/src/controllers/home_controller.py
import time
from src.config.database import buscar_dados_home

async def get_home_data():
    db_data = buscar_dados_home()
    return {
        "status": "success",
        "timestamp": int(time.time()),
        "data": db_data
    }