# Procedimento Operacional Padrão (POP) - 01: Criar Branch no Git

## 1. Identificação
* **Título:** Como criar uma branch padronizada para desenvolvimento de tarefas.
* **Objetivo:** Garantir o isolamento do código em desenvolvimento e manter a padronização e rastreabilidade com o quadro de tarefas do GitHub.
* **Responsável:** Desenvolvedor.
* **Quando usar:** Sempre que iniciar uma nova tarefa (Issue) atribuída no quadro Scrum/Kanban.

## 2. Pré-requisitos
1. Possuir o Git instalado e configurado localmente.
2. Ter o repositório do projeto clonado na máquina.
3. Ter uma Issue associada ao seu nome no quadro de tarefas e identificar o seu ID (ex: #12).

## 3. Passo a Passo (Execução)
1. Abra o terminal na pasta raiz do projeto.
2. Certifique-se de que está na branch principal de desenvolvimento e atualizada executando:
   ```bash
   git checkout develop
   git pull origin develop