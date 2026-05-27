# Template de Sprint: Sprint 02

## 1. Informações Gerais
* **Nome da Sprint:** Configuração de Ambiente e Base de Dados
* **Período:** [21/05/2026] a [26/05/2026]
* **Duração:** 1 semana

---

## 2. Planejamento da Sprint

### 2.1 Objetivo da Sprint
Configurar o desenvolvimento da equipe, estruturar o banco de dados do projeto e desenvolver as funcionalidades iniciais necessárias para o funcionamento.
### 2.2 Backlog Selecionado
Listagem de tarefas (Issues) que foram puxadas do Product Backlog para esta Sprint:

| ID da Issue | Título da Tarefa / Funcionalidade | Responsável | Status Inicial |
| :--- | :--- | :--- | :--- |
| #01 | Configurar ambiente Flutter e dependências do projeto | Erick Hayashi C. de Freitas | Feito |
| #02 | Estruturar e configurar banco de dados da aplicação | Gustavo Henrique Satorato | Feito|
| #03 | Implementar integração com API do Google | Miqueias Souza da Silva | A Fazer |
| #04 | Criar tela inicial e login do aplicativo |Eric Augusto Juliani | A Fazer |
| #05 | Configurar repositório GitHub e organização das branches | Gabriel da Silva Portella |Feito |
| #06 | Testar conexão entre Flutter, API e banco de dados | Gustavo Henrique Satorato e Miqueias Souza da Silva | A Fazer |

### 2.3 Critérios de Pronto (Definition of Done - DoD)
Para que uma tarefa seja considerada "Pronta" (Done) nesta equipe, ela deve cumprir os seguintes requisitos de qualidade:
* [ ] O código foi revisado por pelo menos um outro membro do grupo (Code Review via Pull Request).
* [ ] Funcionalidade testada localmente e sem erros aparentes.
* [ ] Documentação e arquivos do ambiente associados foram atualizados.
* [ ] Commits realizados seguindo o padrão definido no workflow da equipe.

---

## 3. Gestão de Riscos e Impedimentos

### 3.1 Riscos Identificados
* **Risco:** Dificuldade na integração da API do Google com Flutter.
  * **Mitigação:** Consultar a documentação oficial da API e realizar testes separados antes da integração final.
* **Risco:** Problemas de conexão entre aplicação e banco de dados.
  * **Mitigação:** Testar a conexão em ambiente local antes da implementação completa.
* **Risco:** Pouca experiência da equipe com Flutter.
  * **Mitigação:** Dividir tarefas conforme o nível de conhecimento e realizar apoio entre os integrantes.

### 3.2 Registro de Impedimentos (Bloqueios)
* **Impedimento 01:** Erro na autenticação da API do Google.
  * **Solução aplicada:** Revisão das credenciais da API e configuração correta do arquivo de autenticação.
* **Impedimento 02:** Falha na sincronização do banco de dados com o aplicativo.
  * **Solução aplicada:** Ajuste nas configurações de conexão e testes utilizando banco local temporário.

---

## 4. Evidências de Execução e Entrega
*Espaço destinado a comprovar de forma real que o trabalho foi realizado (Não basta explicar, é necessário mostrar).*

* **Link do Quadro Kanban:** https://github.com/Mikeszs/PoupePC.git

---

## 5. Fechamento da Sprint

### 5.1 Registro de Revisão (Sprint Review)
*Ocorreu em: [26/05/2026]*
* **Incremento Gerado:** Aplicação Flutter configurada, integração inicial com API do Google funcionando e banco de dados conectado ao sistema.
* **Feedback/Validação:** A estrutura inicial do aplicativo foi aprovada, porém ainda será necessário melhorar o tratamento de erros e otimizar algumas funcionalidades da integração com a API.

### 5.2 Registro de Retrospectiva (Sprint Retrospective)
*Ocorreu em: [26/05/2026]*

* **O que funcionou bem?**
  * 1. Boa colaboração entre os membros da equipe durante o desenvolvimento.
  * 2. Organização correta das branches e commits no GitHub
* **O que pode ser melhorado?**
  * 1. Melhor gerenciamento do tempo das tarefas.
  * 2. Mais testes antes de integrar novas funcionalidades.
* **Plano de Ação para a próxima Sprint:**
  * [ ] Melhorar a documentação técnica do projeto.
  * [ ] Implementar testes automatizados.
  * [ ] Organizar reuniões rápidas para acompanhamento diário das tarefas.