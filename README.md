<!-- In this section add logo or name of the proyect -->

<p align="center">
<img src="https://github.com/jglovier/dotfiles-logo/blob/master/dotfiles-logo.png" alt="dotfiles logo" width="400">
</p>

<!-- In this section add a brief description of the proyect, add (WIP) if is a work in progress -->
<div align="center">:octocat: Development environment setup, where :heart: my belongs.</div>
<br />
<div align="center">
</div>

<!-- In this section add TOC for easy navegation -->
<p align="center">
<b><a href="#overview">Overview</a></b>
|
<b><a href="#features">Features</a></b>
|
<b><a href="#installation">Installation</a></b>
|
<b><a href="#updating">Updating</a></b>
|
<b><a href="#setup">Setup</a></b>
|
<b><a href="#structure">Structure</a></b>
|
<b><a href="#credits">Credits</a></b>
|
<b><a href="#license">License</a></b>
</p>

<br>

<!-- In this section add badges for detailed information -->

<a href="http://www.repostatus.org/#active"><img src="http://www.repostatus.org/badges/latest/active.svg" alt="Project Status: Active – The project has reached a stable, usable state and is being actively developed." /></a>
![](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)
![](https://img.shields.io/badge/documentation-etc-red.svg?style=flat-square)

## Overview
This repository contains configuration files I use on Linux systems which have been inspired by the rest of the dotfiles community.

Current programs that I use: Xmonad, Xmobar, Urxvtc, Neovim, Tmux. 

<p align="right"><a href="#top">:arrow_up:</a></p>

## Features

### Keyboard setting
* `<Caps>` remapped to `<ESC>` and `<Win>` with [xmodmap](https://wiki.archlinux.org/index.php/xmodmap) script.
* Use of [xcape](https://github.com/alols/xcape) script.

### Keybinding

| Program| PREFIX/LEADER/META(M) |
|--------|-----------------------|
| XMonad |      Win              |
| i3wm   |      Win              |
| Tmux   |   CTRL-Space          |
| Vim    |     Space             |

### XMonad Keybinding

| Action           | Keybinding (M=META)     |
|------------------|-------------------------|
| Open program     |  M-p                    |
| Change program   |  M-Ctrl-p               |
| Minimize window  |  M-m                    |
| Restore window   |  M-Ctrl-m               |
| Maximize window  |  M-f                    |
| Close window     |  M-Ctrl-c               |

### Vim-like keybinding programs
* File manager:
  * [vifm](https://github.com/vifm/vifm)
  * [ranger](https://github.com/hut/ranger)
* PDF Reader: [Zathura](https://git.pwmt.org/pwmt/zathura)

### Shell - What's included?
* Use of [ZSH](https://github.com/zsh-users/zsh).
  * [Config file](https://github.com/gmartinezramirez/dotfiles/blob/master/.zshrc).
* ZSH plugin manager: 
  * [Zplug](https://github.com/b4b4r07/zplug)
* Use of aliases.
* Plugins:
  * [enhancd](https://github.com/b4b4r07/enhancd):A next-generation cd command with an interactive filter.
  * [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search): Zsh port of Fish shell's history search feature. https://sunaku.github.io/switching-from-fish-to-zsh.html
  * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): Fish shell like syntax highlighting for Zsh. 
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Fish-like autosuggestions for Zsh.
  * [zsh-completions](https://github.com/zsh-users/zsh-completions): Additional completion definitions for Zsh.
* Colorscheme: Gruvbox [Gruvbox](https://github.com/chriskempson/base16-shell):
* [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder written in Go.

### Vim - What's included?
* Use of [Neovim](https://github.com/neovim/neovim)
  * [Config file](https://github.com/gmartinezramirez/dotfiles/blob/master/.vimrc)
* Set `<leader>` to a single `<space>`.
* Plugin manager: [Vim-Plug](https://github.com/junegunn/vim-plug)
* Status Bar: [Lightline](https://github.com/itchyny/lightline.vim)
* Colorscheme: [Base16-vim](https://github.com/chriskempson/base16-vim)
* Switch between the last two files with space-space.
* Essential plugins:
  * [EasyMotion](https://github.com/easymotion/vim-easymotion): Vim motions on speed!.
  * [fzf.vim](https://github.com/junegunn/fzf.vim): Things you can do with fzf and Vim.
  * [IndentLine](https://github.com/Yggdroot/indentLine): A vim plugin to display the indention levels with thin vertical lines.
  * [Deoplete](https://github.com/Shougo/deoplete.nvim): Asynchronous completion framework for Neovim.
  * [UltiSnips](https://github.com/SirVer/ultisnips): The ultimate snippet solution for Vim.
  * [Neomake](https://github.com/benekastah/neomake): Asynchronous :make using Neovim's job-control functionality.
  * [Vim-test](https://github.com/janko-m/vim-test): Run your tests at the speed of thought.
  * [Fugitive](https://github.com/tpope/vim-fugitive): fugitive.vim: a Git wrapper so awesome, it should be illegal.
  * [Vim-Projectionist](https://github.com/tpope/vim-projectionist):projectionist.vim: project configuration
  * [Vim-Repeat](https://github.com/tpope/vim-repeat): repeat.vim: enable repeating supported plugin maps with ".".
  * [Vim-Sleuth](https://github.com/tpope/vim-sleuth): sleuth.vim: Heuristically set buffer options
  * [Vim-gitgutter](https://github.com/airblade/vim-gitgutter): Shows a git diff in the gutter (sign column) and stages/reverts hunks.
  * [Limelight](https://github.com/junegunn/limelight.vim): Hyperfocus-writing in Vim.
  * [Goyo](https://github.com/junegunn/goyo.vim): Distraction-free writing in Vim.
  * [gv](https://github.com/junegunn/gv.vim): A git commit browser.
  * [vim-devicons](https://github.com/ryanoasis/vim-devicons): Adds font icons.
  * [vimwiki](https://github.com/vimwiki/vimwiki): Personal Wiki for Vim.

## Tmux - What's included?
* Set prefix to `<Ctrl>+<space>`
* Plugin manager: [TPM](https://github.com/tmux-plugins/tpm)
* Session manager: [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
* Plugins:
 * [tmux-sessionist](https://github.com/tmux-plugins/tmux-sessionist): Lightweight tmux utils for manipulating tmux sessions.
 * [tmux-yank](https://github.com/tmux-plugins/tmux-yank): Tmux plugin for copying to system clipboard.
 * [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat): A plugin that enhances tmux search.
 * [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect): Persists tmux environment across system restarts. 
 * [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum): Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on.

### XMonad - What's included?
* Set prefix to `<Win>`
* Scripts used:
 * [i3-alternating-layout](https://github.com/olemartinorg/i3-alternating-layout): Scripts to open new windows in i3wm using alternating layouts (splith/splitv) for each new window.

### Git Utilities
* [Tig](https://github.com/jonas/tig)

## Installation

Open up a terminal, type the installation command below:
Run the following command to set up a new machine:

```
$ git clone https://github.com/gmartinezramirez/dotfiles.git
$ cd ~/dotfiles && make install
```
<p align="right"><a href="#top">:arrow_up:</a></p>

## Updating

```	
$ cd ~/.dotfiles && git update
```	

<p align="right"><a href="#top">:arrow_up:</a></p>

## Setup

<p align="right"><a href="#top">:arrow_up:</a></p>

## Structure

<p align="right"><a href="#top">:arrow_up:</a></p>

## Credits

<p align="right"><a href="#top">:arrow_up:</a></p>

## Licence ![](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)

Copyright (c) 2016 "Gonzalo Martinez Ramirez" gmartinezramirez

Licensed under the MIT license.

Unless attributed otherwise, everything is under the MIT licence. Some stuff is not from me, and without attribution, and I no longer remember where I got it from. I apologize for that.
