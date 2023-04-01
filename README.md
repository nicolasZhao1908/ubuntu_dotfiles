# Dotfiles

It uses `GNU Stow` for a dead easy dotfiles management, folder. The following
chunk of text shows an example of how it works:

```txt
~/dotfiles
➜ tree .
.
└── foo

➜ stow .
➜ tree ..
.
└── foo --> ~/dotfiles/foo
```

```bash
# at $HOME directory
git clone https://github.com/nicolasZhao1908/dotfiles
xargs sudo apt-get install < packages
sudo apt install stow
stow .
```

## Appearance

- [`i3wm`](https://i3wm.org/)
- [`Picom`](https://github.com/yshui/picom)
- [`nitrogen`](https://nitrogenproject.com/downloads), background manager for X.
- `NotoSansMono Nerd Font`, font family.

## Core apps

- [`Firefox developer`](https://www.mozilla.org/en-US/firefox/developer/)

## Shell

- [`zsh`](https://www.zsh.org/)
- [`zsh-autosuggestion`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`zsh-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`starship prompt`](https://starship.rs)
- [`alacritty`](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
- [`tmux`](https://github.com/tmux/tmux/wiki/Installing)
- [`tpm`](https://github.com/tmux-plugins/tpm)

## Core utilities

- [`task warrior`](https://taskwarrior.org/), todo list binary.
- [`gh`](https://cli.github.com/), github command-line tool.
- [`fzf`](https://github.com/junegunn/fzf), fuzzy finder.
- [`exa`](https://github.com/ogham/exa), ls replacement.
- [`bat`](https://github.com/sharkdp/bat), cat replacement.
- [`zoxide`](https://github.com/ajeetdsouza/zoxide), cd replacement.
- [`ripgrep`](https://github.com/BurntSushi/ripgrep), grep replacement.

## Neovim plugins

- `Lazy`: Plugin manager
- `Mason`: LS manager
- `gruvbox_material`: Theme
- `Treesitter`: Syntax highlighting
- `Telescope`: Fuzzy finder
- `Null-ls`: Formatting and linter config
- `LSP Zero`
- `nvim-cmp`
- `Tmux-Neovim`
- `Nvim-tree`
- `Harpoon`
- `Comment`
- `Indent-blankline`
- `Lualine`
- `Nvim-colorizer`
- `LuaSnip`

## Rust

[`rust`](https://www.rust-lang.org/learn/get-started)

- `cargo-watch`, tests/runs/builds/lints code on change.
- `cargo-expand`, expands Rust macros.
- `sccache`, cache for faster build time.

## Python

- [`pyenv`](https://github.com/pyenv/pyenv#automatic-installer)

## Node js

- [`nvm`](https://github.com/nvm-sh/nvm), node version manager.
- [`pnpm`](https://pnpm.io/), `npm` alternative.

## Writing

- [`vale`](https://vale.sh/), prose linter.
- [`zotero`](https://www.zotero.org/), reference manager.
- [`zathura`](https://pwmt.org/projects/zathura/), PDF viewer.

### Latex packages

- `texlive`, Latex's distro.
- `biber`
- `latexmk`, Latex's Make
- `texlive-luatex`, Latex's compiler
- `texlive-lang-spanish`
- `texlive-latex-extra`
- `texlive-fonts-extra`
