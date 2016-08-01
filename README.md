<!-- In this section add logo or name of the proyect -->
<!-- <h1 align="center">dotfiles</h1> -->

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

![](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)
![](https://img.shields.io/badge/documentation-etc-red.svg?style=flat-square)

## Overview

<p align="right"><a href="#top">:arrow_up:</a></p>

## Features

### Keyboard setting
* `<Caps>` remapped to `<ESC>` with [xmodmap](https://wiki.archlinux.org/index.php/xmodmap) script
* Use of [xcape](https://github.com/alols/xcape)

### Vim-like keybinding programs
* File manager:
  * [vifm](https://github.com/vifm/vifm)
  * [ranger](https://github.com/hut/ranger)
* Mail: [neomutt](https://github.com/neomutt/neomutt)
* PDF Reader: [Zathura](https://git.pwmt.org/pwmt/zathura)

### Shell - What's included?
* Use of [ZSH](https://github.com/zsh-users/zsh).
* ZSH plugin manager: 
  * [Zplug](https://github.com/b4b4r07/zplug)
  * [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* Use of aliases.
* Plugins:
  * [enhancd](https://github.com/b4b4r07/enhancd):A next-generation cd command with an interactive filter.
  * [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search): Zsh port of Fish shell's history search feature. https://sunaku.github.io/switching-from-fish-to-zsh.html
  * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): Fish shell like syntax highlighting for Zsh. 
  * [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Fish-like autosuggestions for Zsh.
  * [zsh-completions](https://github.com/zsh-users/zsh-completions): Additional completion definitions for Zsh.
* Colorscheme: Base16-Solarized Dark [Base16-shell](https://github.com/chriskempson/base16-shell):
* [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder written in Go.

### Vim - What's included?
* Use of [Neovim](https://github.com/neovim/neovim)
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

### i3wm - What's included?
* Set prefix to `<Ctrl>`
* Scripts used:
 * [i3-alternating-layout](https://github.com/olemartinorg/i3-alternating-layout): Scripts to open new windows in i3wm using alternating layouts (splith/splitv) for each new window.

### Git Utilities
* [Tig](https://github.com/jonas/tig)
* [gitsh](https://github.com/thoughtbot/gitsh)

### Git workflows
* [git-flow](https://github.com/nvie/gitflow)
* [gitlab-flow](https://about.gitlab.com/2014/09/29/gitlab-flow/)
* [github-flow](https://guides.github.com/introduction/flow/)
* [git-DMZ-flow](https://gist.github.com/djspiewak/9f2f91085607a4859a66)

### TODO
- [ ] Use [EditorConfig](https://github.com/editorconfig) for consistent coding style between IDEs and editors.
- [ ] Use [ternjs](https://github.com/ternjs) for Javascript analyzer.

<p align="right"><a href="#top">:arrow_up:</a></p>

## Installation

Open up a terminal, type the installation command below:
Run the following command to set up a new machine:

<table>
    <thead>
        <tr>
            <th></th>
            <th><a name="oneliner">Installation command</a></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>Git</strong></td>
            <td>git clone https://github.com/gmartinezramirez/dotfiles.git</td>
        </tr>
    </tbody>
</table>

- General download method using the `git` command:

	```console
	$ git clone https://github.com/gmartinezramirez/dotfiles.git ~/.dotfiles
	$ cd ~/.dotfiles && make install
	```

<p align="right"><a href="#top">:arrow_up:</a></p>

## Updating

	```console
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
