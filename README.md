# Dotfiles

This is my dotfiles for an Ubuntu 22.04 OS machine. It uses `GNU Stow` for a
dead easy dotfiles management. The following chunk of text shows an example of
how it works:

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

> Note that many packages from APT may be really outdated, so apps like
> Neovim and Firefox is not included in `Packages` and should be manually
> compiled in order to get the most recent versions.

> [Optionally, remove Snap and replace it with Flatpak](https://github.com/popey/unsnap)

```bash
cd ~
git clone https://github.com/nicolasZhao1908/dotfiles
sudo apt update
sudo apt upgrade
grep -vE "^#" Packages | xargs sudo apt install
stow .
```

## Appearance

- [`i3wm`](https://i3wm.org/)
- [`Picom`](https://github.com/yshui/picom)
- [`lxappearance`](https://github.com/lxde/lxappearance), GTK theme switcher GUI
- [`Polybar`](https://github.com/polybar/polybar/), task bar
- `NotoSansMono Nerd Font`, font family.

## Shell

- [`zsh`](https://www.zsh.org/)
- [`zsh-autosuggestion`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`zsh-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`starship prompt`](https://starship.rs)
- [`alacritty`](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
- [`tmux`](https://github.com/tmux/tmux/wiki/Installing)

## Core utilities

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
| fzf                 | Fuzzy finder.                         |
| gh                  | Github command-line tool.             |
| feh                 | Wallpaper manager and image viewer.   |
| zathura             | PDF viewer.                           |
| exa                 | `ls` replacement.                     |
| bat                 | `cat` replacement.                    |
| zoxide              | `cd` replacement.                     |
| ripgrep             | `grep` replacement.                   |

## Core Apps

- [`Firefox developer`](https://www.mozilla.org/en-US/firefox/developer/)
- [`Thunar`](https://docs.xfce.org/xfce/thunar/start), xfce file manager GUI.
- [`Flameshot`](https://flameshot.org/), screenshot.
- [`Obsidian`](https://obsidian.md/), note taking.
  - [`Excalidraw plugin`](https://github.com/zsviczian/obsidian-excalidraw-plugin)
- [`Rofi`](https://github.com/davatorium/rofi), application launcher.
- [`Syncthing`](https://syncthing.net/), synchronization server.
- [`Discord`](https://discord.com/)

## IDE

[Neovim](https://neovim.io/)

| Plugin name      | Description                              |
| ---------------- | ---------------------------------------- |
| Lazy             | Plugin manager                           |
| LSP Config       | LSP configuration                        |
| Mason            | Language/Linter/Formatter Server manager |
| Treesitter       | Syntax highlighting                      |
| Telescope        | Fuzzy finder                             |
| nvim-cmp         | Autcompletion                            |
| Tmux-Neovim      | Neovim like tmux navigation              |
| Nvim-tree        | File tree                                |
| Harpoon          | Quick file switcher                      |
| Lualine          | Status bar                               |
| gruvbox_material | Theme                                    |

## Virtualization

- [`KVM`](https://ubuntu.com/blog/kvm-hyphervisor), Linux native hypervisor.
- [`Virt-Manager`](https://virt-manager.org/), KVM-Qemu GUI.

## Docker

- [`docker`](https://docs.docker.com/engine/install/)
- [`docker-compose`](https://docs.docker.com/compose/install/)

## Language Specific

### Rust

[`rust`](https://www.rust-lang.org/learn/get-started)

- `cargo-watch`, tests/runs/builds/lints code on change.
- `cargo-expand`, expands Rust macros.
- `sccache`, cache for faster build time.

### Python

- [`pyenv`](https://github.com/pyenv/pyenv#automatic-installer)

### Node js

- [`nvm`](https://github.com/nvm-sh/nvm), node version manager.
- [`pnpm`](https://pnpm.io/), `npm` alternative.

## Research and note taking

### Zotero

- [`zotero`](https://www.zotero.org/), reference manager.
- [`zotero-storage-scanner`](https://github.com/retorquere/zotero-storage-scanner)
- [`zotfile`](https://github.com/jlegewie/zotfile)

### Chinese keyboard input

```bash
sudo apt install fcitx5 \
fcitx5-chinese-addons \
fcitx5-frontend-gtk4 fcitx5-frontend-gtk3 fcitx5-frontend-gtk2 \
fcitx5-frontend-qt5 \
fcitx5-module-cloudpinyin
```

#### Dictionary installation

```bash
# download dictionary
wget https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict

# move to directory
mkdir -p ~/.local/share/fcitx5/pinyin/dictionaries/
mv zhwiki-20220416.dict ~/.local/share/fcitx5/pinyin/dictionaries/
```

#### Nord Theme

```bash
git clone https://github.com/tonyfettes/fcitx5-nord.git
mkdir -p ~/.local/share/fcitx5/themes/
cd fcitx5-nord
cp -r Nord-Light/ ~/.local/share/fcitx5/themes/

# ~/.config/fcitx5/conf/classicui.conf
Theme=Nord-Light

fcitx5 -r
```

### Latex packages (Just use overleaf instead)

- `texlive`, Latex's distro.
- `biber`
- `latexmk`, Latex's Make
- `texlive-luatex`, Latex's compiler
- `texlive-lang-spanish`
- `texlive-latex-extra`
- `texlive-fonts-extra`
