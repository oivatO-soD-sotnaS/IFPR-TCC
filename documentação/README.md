## Padrão de Commits – Projeto

### Estrutura do Commit

```
<tipo>[escopo opcional]: <descrição curta>

[corpo opcional]

[rodapé opcional para issues, breaking changes ou contexto]
```

---

### Divisão por Escopos

- `frontend`: código do frontend, componentes React, estilização, UX, etc.
- `backend`: rotas, controladores, serviços, lógica de negócio, validações, etc.
- `db`: alterações no banco de dados, modelos, migrations, seeds, etc.
- `api`: comunicação entre frontend e backend (fetch, axios, rotas).
- `config`: configurações de ambiente, docker, linter, CI/CD.
- `docs`: documentação do projeto.
- `infra`: configurações de infraestrutura (ex: NGINX, CI/CD).
- `test`: testes automatizados.

---

### Tipos de Commit

| Tipo       | Significado |
|------------|-------------|
| `feat`     | Adição de nova funcionalidade |
| `fix`      | Correção de bugs |
| `chore`    | Tarefas de manutenção (sem alteração no app em si) |
| `refactor` | Refatorações de código sem mudança de comportamento |
| `style`    | Alterações visuais ou de formatação (semântico, CSS, ESLint) |
| `perf`     | Melhorias de performance |
| `test`     | Adição ou modificação de testes |
| `docs`     | Alterações na documentação |
| `build`    | Mudanças que afetam o processo de build |
| `revert`   | Reversão de um commit anterior |

---

### Exemplos

```bash
feat(frontend): criar componente de botão primário
fix(backend): corrigir erro de autenticação no login
refactor(db): otimizar estrutura da tabela users
docs: adicionar instruções de setup no README
style(frontend): ajustar padding do formulário de login
test(api): adicionar testes para rota /login
ci: configurar workflow do GitHub Actions
```
