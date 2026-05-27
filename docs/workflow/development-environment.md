# 💻 Ambiente de Desenvolvimento

Este documento define as diretrizes, ferramentas e passos necessários para configurar o ambiente de desenvolvimento local unificado para o projeto **PoupePC**, garantindo que todos os membros da equipe trabalhem com versões compatíveis das tecnologias.

---

## 1. Stack Tecnológica OBRIGATÓRIA

Para o correto funcionamento dos componentes do ecossistema PoupePC, as seguintes versões devem ser instaladas e configuradas:

| Componente | Tecnologia | Versão Homologada | Escopo de Uso |
| :--- | :--- | :--- | :--- |
| **Linguagem Back-End** | Python | `3.10.x` ou superior | Scripts de automação, raspagem e API |
| **Banco de Dados** | SQLite | `3.x` (Nativo) | Persistência local e testes rápidos |
| **Framework Mobile** | Flutter / Dart | Flutter `3.22.x` (Dart `3.4.x`) | Interface Mobile e Web Responsiva |
| **Ambiente Web Base** | HTML5 / CSS3 / JS | Padrão ES6+ | Interface Web legada/alternativa |
| **IDE Recomendada** | VS Code / Android Studio | Última versão estável | Desenvolvimento geral e emulação |

---

## 2. Configuração do Ambiente Passo a Passo

### 2.1. Configurando o Back-End (Python & SQLite)
1. Instale o Python assegurando-se de marcar a opção **"Add Python to PATH"** no instalador.
2. No terminal, navegue até a raiz do projeto e crie um ambiente virtual (`venv`) para isolar as dependências:
```bash
   python -m venv venv