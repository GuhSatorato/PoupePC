# 🔄 Fluxo de Trabalho (Workflow) - PoupePC

Este documento descreve os padrões operacionais, a metodologia de gerenciamento de projetos e o fluxo de versionamento de código adotados pela equipe **PoupePC** para garantir a consistência, qualidade e agilidade nas entregas.

---

## 1. Metodologia Ágil e Governança

O desenvolvimento do PoupePC baseia-se em metodologias ágeis adaptadas para o ambiente acadêmico e de desenvolvimento acelerado (Projeto Trainee).

*   **Sprints:** Ciclos de desenvolvimento estruturados com entregas de artefatos e códigos homologados.
*   **Quadro Kanban (`kanban.md`):** Utilizado para o rastreamento visual das tarefas em tempo real, dividido em:
    *   `Backlog`: Idéias e requisitos validados pela Visão do Projeto.
    *   `A Fazer (To Do)`: Tarefas priorizadas para a Sprint corrente.
    *   `Em Progresso (In Progress)`: Demandas em execução ativa por um membro da equipe.
    *   `Em Revisão (Review)`: Código em Pull Request ou documentação em fase de validação.
    *   `Concluído (Done)`: Itens validados, testados e mesclados.
*   **Cronograma (Gráfico de Gantt):** Planejamento macro de longo prazo utilizado pelo Líder de Projeto para acompanhar os prazos de entrega de cada Sprint e gerenciar riscos de atraso.

---

## 2. Estrutura de Papéis no Fluxo de Trabalho

Para evitar gargalos e conflitos de escopo, as atribuições operacionais seguem a matriz de competências da equipe:

*   **Gestão e Documentação (Erick Hayashi):** Valida se os cards do Kanban refletem o status real e homologa os relatórios de Sprint.
*   **Banco de Dados (Gustavo Satorato):** Responsável por revisar e aprovar qualquer alteração estrutural no `database_manager.py` ou esquemas SQLite/MySQL.
*   **Back-End (Miqueias Souza):** Desenvolve e integra as regras de negócio em Python.
*   **Front-End (Eric Augusto):** Implementa as telas Web (HTML/CSS/JS) e Mobile (Flutter/Dart).
*   **UI/UX (Gabriel Portella):** Fornece os protótipos de alta fidelidade antes do início do desenvolvimento da funcionalidade no Front-End.