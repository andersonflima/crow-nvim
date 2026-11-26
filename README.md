# crow-nvim

Configuração pessoal do Neovim baseada no LazyVim. Abre com o tema claro Crowquill, inclui a variante escura e reúne ferramentas para editar TypeScript, Python, Go, Rust, Elixir, Java, Markdown e YAML. O lazy.nvim gerencia os plugins, com as revisões registradas em `lazy-lock.json`.

## Experimentar sem alterar seu Neovim atual

Tenha Git, Neovim e Fish disponíveis no terminal. A configuração usa Fish como shell interno e foi testada com Neovim 0.12.6 no macOS. A primeira abertura precisa de internet para baixar os plugins.

Execute estes comandos com o diretório de destino livre:

```sh
git clone https://github.com/andersonflima/crow-nvim.git ~/.config/crow-nvim
NVIM_APPNAME=crow-nvim nvim
```

Use o mesmo comando com `NVIM_APPNAME` nas próximas aberturas. Dentro do editor, `:Lazy` mostra o progresso da instalação e `:checkhealth` indica ferramentas que faltam para os recursos habilitados.

## Usar como configuração principal

Em uma máquina nova, clone o repositório diretamente em `~/.config/nvim`. Se esse caminho já existir, preserve sua configuração antes de trocá-la. Quem mantém o clone no ghq também pode apontar `~/.config/nvim` para ele com um link simbólico. Assim, salvar pelo editor altera os mesmos arquivos que aparecem em `git status`. Para compartilhar uma alteração, faça commit e push no clone.

## No editor

| Ação | Comando |
| --- | --- |
| Alternar para o tema escuro | `:colorscheme crowquill` |
| Voltar ao tema claro | `:colorscheme crowquill-light` |
| Restaurar as revisões de plugins do repositório | `:Lazy restore` |
| Abrir ou recolher o terminal do Claude Code | `:ClaudeToggle` ou `Ctrl+]` no modo normal. Requer o comando `claude` no PATH. |

## Onde personalizar

- [Configuração do LazyVim](lua/config/lazy.lua) carrega os extras de linguagens, ESLint, Prettier e Black.
- [Atalhos](lua/config/keymaps.lua) e [opções do editor](lua/config/options.lua) controlam o comportamento local.
- [Plugins](lua/plugins/) reúne as configurações de edição, LSP, interface e tema.
- [Cores](colors/) contém as variantes Crowquill clara e escura.
