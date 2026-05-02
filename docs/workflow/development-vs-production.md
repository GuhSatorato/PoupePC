1. Estratégia de Branches
Utilizamos uma adaptação do modelo Git Flow para organizar o desenvolvimento:

main (Produção): Contém o código 100% estável e testado. Somente o código que foi aprovado em todas as etapas de desenvolvimento é mesclado (merge) aqui. É a branch que o professor deve considerar como o "produto final" de cada Sprint.

develop (Desenvolvimento): É a branch de integração. Todo código de novas funcionalidades passa por aqui primeiro. Ela reflete o estado atual do projeto para a próxima entrega.

feature/ (Funcionalidades): Branches temporárias criadas para tarefas específicas.

Exemplo: feature/login-system, feature/sqlite-setup.

Após a conclusão da tarefa, a branch é mesclada em develop e excluída.

2. Fluxo de Trabalho (Workflow)
O membro da equipe cria uma branch a partir da develop.

Desenvolve a funcionalidade e realiza os commits locais.

Faz o push da branch para o GitHub para revisão dos pares.

Realiza o Pull Request (PR) para a branch develop.

Ao final da Sprint, a develop é mesclada na main para a entrega oficial.

3. Ambiente de Execução
Ambiente Local: Durante a Sprint 02, o desenvolvimento ocorre em ambiente local com o banco de dados poupe_pc.db (SQLite) gerado automaticamente pelo script Python.

Produção: Futuramente, o ambiente de produção será preparado para rodar em servidores (Web/Mobile) com as configurações de segurança finais.