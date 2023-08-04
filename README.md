# Dotfiles

Dotfiles for an Ubuntu 22.04 OS machine. It uses `GNU Stow` for a
dead easy dotfiles management. The following code snippet shows an example of
how `GNU Stow` works:

```txt
➜ tree -L 1 ~/dotfiles
.
└── foo

➜ cd ~/dotfiles
➜ stow .
➜ tree -L 1 ~
.
├─ foo --> ~/dotfiles/foo
├─ ...
├─ ...
└─ dotfiles
```

> Many packages from APT are really outdated, so apps like
> Neovim and Firefox are not included in the `Packages` file and should be 
> manually compiled in order to get the most recent versions.

> [Optionally, remove Snap and replace it with Flatpak](https://github.com/popey/unsnap)

```bash
cd ~
git clone https://github.com/nicolasZhao1908/dotfiles
sudo apt update
sudo apt upgrade
grep -vE "^#" Packages | xargs sudo apt install
stow .
```

## Core

| Name                | Description                           |
| ------------------- | ------------------------------------- |
| xorg                | Display server                        |
| xinit               | Initialize programs before WM starts. |
| arandr              | `xrandr` GUI.                         |
| Network Manager     | Manages network connections.          |
| nm-applet           | Network manager systray.              |
| lightdm             | Login Manager.                        |
| pactl               | PulseAudio volume control.            |
| pavucontrol         | PulseAudio GUI.                       |
| xfce4-power-manager | Power Manager.                        |
| brightnessctl       | Brightness control.                   |
| libmtp              | Media Transfer Protocol               |
| dunst               | Notification Manager                  |
| i3wm                | Tiling Window Manager                 |
| Polybar             | Task bar                              |
| auto-cpufreq        | Automatic power management            |

## Shell

-   [Zsh](https://www.zsh.org/)
    -   [Zsh-autosuggestion](https://github.com/zsh-users/zsh-syntax-highlighting)
    -   [Zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    -   [Starship prompt](https://starship.rs)
-   [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md), terminal emulator.
-   [Tmux](https://github.com/tmux/tmux/wiki/Installing), terminal multiplexor.

### CLI Utilities

-   [fzf](https://github.com/junegunn/fzf), Fuzzy finder.
-   [exa](https://github.com/ogham/exa), `ls` replacement.
-   [bat](https://github.com/sharkdp/bat), `cat` replacement.
-   [fd](https://github.com/sharkdp/fd), `find` replacement.
-   [zoxide](https://github.com/ajeetdsouza/zoxide), smart `cd`.
-   [ripgrep](https://github.com/BurntSushi/ripgrep), `grep` replacement.
-   [sccache](https://github.com/mozilla/sccache), cache for faster build time.
-   [hyperfine](https://github.com/sharkdp/hyperfine), benchmarking tool.

## Web browsers

[Firefox developer](https://www.mozilla.org/en-US/firefox/developer/)

## PDF viewer

[Zathura](https://pwmt.org/projects/zathura/)

## Image Viewer and Wallpapers

[feh](https://github.com/derf/feh)

[nsxiv](https://codeberg.org/nsxiv/nsxiv)

## Application launcher

[Rofi](https://github.com/davatorium/rofi), application launcher.

## Sync service

[Syncthing](https://syncthing.net/).

## Note taking

[Obsidian](https://obsidian.md/)

## File manager

[nnn](https://github.com/jarun/nnn), CLI

[Thunar](https://docs.xfce.org/xfce/thunar/start), xfce GUI.

## IDE

[Neovim](https://neovim.io/)

| Plugin name  | Description                               |
| ------------ | ----------------------------------------- |
| Lazy         | Plugin manager                            |
| Dayfox       | Theme                                     |
| LSP Config   | LSP configuration                         |
| Mason        | Language/Linter/Formatter servers manager |
| nvim-cmp     | Autcompletion                             |
| Vim-fugitive | Git integration                           |
| Treesitter   | Syntax highlighting                       |
| Telescope    | Fuzzy finder                              |
| Tmux-Neovim  | Neovim like tmux navigation               |
| Nvim-tree    | File tree                                 |
| Harpoon      | Quick file switcher                       |
| Lualine      | Status bar                                |

## Virtual machine

-   [KVM](https://ubuntu.com/blog/kvm-hyphervisor), Linux native hypervisor.
-   [Virt-Manager](https://virt-manager.org/), KVM-Qemu GUI.

## Container

-   [docker](https://docs.docker.com/engine/install/)
-   [docker-compose](https://docs.docker.com/compose/install/)

## Font Family

[Noto Sans Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Noto/Sans-Mono)

```bash
unzip <filename>.zip
mv <filename>/*.ttf  ~/.local/share/fonts
fc-cache -vf
fc-list | grep "NotoSansMNerdFont"
```

## Programming language tools

### Rust

[`Rust`](https://www.rust-lang.org/learn/get-started)

-   `rustlings`, exercises.
-   `cargo-watch`, tests/runs/builds/lints code on change.
-   `cargo-expand`, expands Rust macros.
-   `cargo-update`, update crates.
-   `cargo-generate`, project template generator.

### Python

-   [pyenv](https://github.com/pyenv/pyenv#automatic-installer)

### Node js

-   [nvm](https://github.com/nvm-sh/nvm), node version manager.
-   [pnpm](https://pnpm.io/), `npm` alternative.

## Research

-   [zotero](https://www.zotero.org/)
-   [zotero-storage-scanner](https://github.com/retorquere/zotero-storage-scanner)
-   [Better BibTeX]https://github.com/retorquere/zotero-better-bibtex()
-   [zotfile](https://github.com/jlegewie/zotfile)

### Latex packages

> Consider adding the [vimtex](https://github.com/lervag/vimtex) plugin for latex local development.

-   `texlive`, Latex's distro.
-   `biber`
-   `latexmk`, Latex's Make
-   `texlive-luatex`, Latex's compiler
-   `texlive-lang-spanish`
-   `texlive-latex-extra`
-   `texlive-fonts-extra`

## Server settings

```bash
curl https://raw.githubusercontent.com/nicolasZhao1908/dotfiles/main/.vimrc > .vimrc
curl https://raw.githubusercontent.com/nicolasZhao1908/dotfiles/main/.tmux.conf > .tmux.tmux.conf
```

## Chinese keyboard input

```bash
sudo apt install fcitx5 \
fcitx5-chinese-addons \
fcitx5-frontend-gtk4 fcitx5-frontend-gtk3 fcitx5-frontend-gtk2 \
fcitx5-frontend-qt5 \
fcitx5-module-cloudpinyin
```

### Dictionary installation

```bash
# download dictionary
wget https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict

# move to directory
mkdir -p ~/.local/share/fcitx5/pinyin/dictionaries/
mv zhwiki-20220416.dict ~/.local/share/fcitx5/pinyin/dictionaries/
```

### Nord Theme

```bash
git clone https://github.com/tonyfettes/fcitx5-nord.git
mkdir -p ~/.local/share/fcitx5/themes/
cd fcitx5-nord
cp -r Nord-Light/ ~/.local/share/fcitx5/themes/

# ~/.config/fcitx5/conf/classicui.conf
Theme=Nord-Light

fcitx5 -r
```
