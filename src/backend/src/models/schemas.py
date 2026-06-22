from pydantic import BaseModel, EmailStr, Field

class UsuarioCadastro(BaseModel):
    nome: str = Field(..., min_length=3, max_length=50)
    email: EmailStr
    senha: str = Field(..., min_length=6)

class UsuarioLogin(BaseModel):
    email: EmailStr
    senha: str