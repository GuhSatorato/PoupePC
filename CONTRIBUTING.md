# 🤝 Guia de Contribuição — PoupePC

Obrigado por contribuir com o PoupePC! Este guia descreve as regras e o fluxo de trabalho que seguimos para manter o projeto organizado.

---

## 🔀 Fluxo de Branches

Utilizamos o modelo **Git Flow**. Veja como contribuir:

### 1. Crie uma branch a partir da `develop`

```bash
git checkout develop
git pull origin develop
git checkout -b feature/nome-da-funcionalidade
```

### 2. Faça suas alterações e commite

```bash
git add .
git commit -m "feat: descrição curta da alteração"
```

### 3. Envie para o GitHub

```bash
git push origin feature/nome-da-funcionalidade
```

### 4. Abra um Pull Request

- **Base:** `develop`
- **Compare:** `feature/nome-da-funcionalidade`
- Descreva o que foi feito e adicione referência à Issue (se houver)

---

## 📝 Padrão de Commits

Utilizamos o padrão **Conventional Commits** para manter o histórico legível:

| Prefixo | Uso |
|---------|-----|
| `feat:` | Nova funcionalidade |
| `fix:` | Correção de bug |
| `docs:` | Alteração na documentação |
| `style:` | Formatação, CSS, sem mudança de lógica |
| `refactor:` | Refatoração de código existente |
| `test:` | Adição ou ajuste de testes |
| `chore:` | Tarefas de manutenção (configs, dependências) |

**Exemplo:**
```
feat: adicionar sistema de busca de componentes
fix: corrigir erro de login com email duplicado
docs: atualizar README com instruções de instalação
```

---

## 🧪 Testes

Antes de abrir um Pull Request, certifique-se de que:

- [ ] O código roda sem erros
- [ ] As funcionalidades existentes não foram quebradas
- [ ] A documentação foi atualizada (se necessário)

---

## 👥 Revisão de Código

- Todo PR precisa de **pelo menos 1 aprovação** de outro membro antes do merge
- Use os comentários do PR para sugerir melhorias
- Seja respeitoso e construtivo nos reviews
