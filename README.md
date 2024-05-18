---
title: Dotfiles
date_created: 2024-01-22 08:25
date_updated: 2024-01-22 08:57
jd: P003.005
aliases:
  - P003.005 Dotfiles
tags:
  - '#personal'
  - '#lists'
  - '#dotfiles'
---

> As managed with [chezmoi](https://www.chezmoi.io)

## Apps

### Gitwatch

Auto-commit dotfile changes

[gitwatch](https://github.com/gitwatch/gitwatch)

- `gitwatch /home/matt/.local/share/chezmoi`

### Rofi

_A window switcher, Application launcher and dmenu replacement._

[rofi](https://github.com/davatorium/rofi)

- rofi -i -show drun -modi drun -show-icons

### Nvim

_hyperextensible Vim-based text editor_

[nvim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

- [lazyvim](https://github.com/LazyVim/LazyVim)
- [lazygit](https://github.com/jesseduffield/lazygit#features)

### Kitty

_The fast, feature-rich, GPU based terminal emulator_

[kitty](https://sw.kovidgoyal.net/kitty/)

- [asdf](https://asdf-vm.com/guide/getting-started.html)

## zsh

### antigen

```bash
curl -L git.io/antigen > antigen.zsh
```

#### Plugins

- zsh-nvm: `antigen bundle lukechilds/zsh-nvm`
