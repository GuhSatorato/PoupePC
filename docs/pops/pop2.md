# Procedimento Operacional Padrão (POP) - 02: Abrir Pull Request (PR)

## 1. Identificação
* **Título:** Como abrir um Pull Request para revisão e integração de código no GitHub.
* **Objetivo:** Padronizar as propostas de mesclagem de código, habilitando a revisão por pares antes que as alterações cheguem ao branch de desenvolvimento.
* **Responsável:** Desenvolvedor.
* **Quando usar:** Assim que concluir o desenvolvimento de uma funcionalidade, realizar todos os testes locais e efetuar os commits na sua branch específica.

## 2. Pré-requisitos
1. Ter realizado os commits locais seguindo a convenção da equipe.
2. Ter enviado a sua branch local para o repositório remoto no GitHub (`git push origin nome-da-branch`).

## 3. Passo a Passo (Execução)
1. Acesse o repositório do projeto no GitHub.
2. Uma barra amarela aparecerá no topo sugerindo a criação do PR. Clique no botão **"Compare & pull request"**.
3. Configure a direção da mesclagem (Base e Compare):
   * **base:** `develop` (nunca envie direto para a `main`)
   * **compare:** `sua-branch-de-recurso` (ex: `feat/12-busca-precos`)
4. No título do Pull Request, utilize o padrão: `tipo(#id): descrição curta` (ex: `feat(#12): adiciona busca de preços`).
5. Na descrição do PR, informe brevemente:
   * O que foi feito;
   * Como testar a alteração;
   * A expressão `Closes #12` (para vincular e fechar a Issue automaticamente no merge).
6. No menu lateral direito, marque pelo menos um membro do grupo como **Reviewer** (Revisor) para fazer o Code Review.
7. Clique em **"Create pull request"**.

## 4. Critérios de Sucesso e Evidências
* **Evidências esperadas:** Link do Pull Request gerado no GitHub e enviado para o canal de comunicação do grupo.
* **Critérios de sucesso:** O PR deve apontar para a branch `develop`, conter o título padronizado com o ID da issue correspondente e possuir pelo menos um revisor atribuído.

## 5. Referências Utilizadas
* GitHub Docs. About pull requests. Disponível em: <https://docs.github.com/en/pull-requests>.