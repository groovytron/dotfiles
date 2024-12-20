# Groovytron dotfiles

[![Build Status](https://travis-ci.org/groovytron/dotfiles.svg?branch=master)](https://travis-ci.org/groovytron/dotfiles)

This is a quick backup of my dotfiles to make tool configuration easier in case
of system issue. The [M̀akefile](https://github.com/groovytron/dotfiles/blob/master/Makefile) can be used to install configurations of different tools.

To install one or many configurations, do the following:

1. Clone the repository into your `$HOME` directory by runnning `git clone https://github.com/groovytron/dotfiles.git ~/dotfiles`.
2. Go into the cloned repository by running `cd ~/dotfiles`.
3. Run `make install_all` to install all the configurations. *You can run `make help` to list all the available installations if you only want to install the configuration of one tool.*

The `Makefile` mainly creates symbolic links but **it will overwrite you current configuration files so have a look at the `Makefile` and backup your configuration files before running something if you are not sure of what you are doing.**

As I was tired to setup and reinstall everything by hand when
I buy a new machine, I wrote [an Ansible playbook](./ansible/playbook.yml) to
automate the tedious installation and setup tasks. It's even tested with
[`molecule`](https://ansible.readthedocs.io/projects/molecule/) combined with
[`podman`](https://podman.io/) !

I use the below tools.

## Shells

- [`bash`](https://www.gnu.org/software/bash/) (because it's simple and quite
  easy to tweak). Check the [.bashrc](https://github.com/groovytron/dotfiles/blob/master/.bashrc) and [.bash_profile](https://github.com/groovytron/dotfiles/blob/master/.bash_profile) files for settings details.
- [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh)
  (when I want a fancy shell). Check the [.zshrc](https://github.com/groovytron/dotfiles/blob/master/.zshrc) file for settings details.

Shells themes can be found in the [.Xresources.basic](https://github.com/groovytron/dotfiles/blob/master/.Xresources.basic) file which contains
a simple theme that I did by myself.

The [.Xresources.solarized](https://github.com/groovytron/dotfiles/blob/master/.Xresources.solarized) file contains a
[solarized color theme](http://ethanschoonover.com/solarized).

The [.Xresources.gruvbox](https://github.com/groovytron/dotfiles/blob/master/.Xresources.gruvbox) file contains a
[gruvbox color theme](https://github.com/morhetz/gruvbox).

To use one of these themes, just copy the one you want into
your home directory and rename it into
`.Xresources`. Do not forget to reboot or launch `xrdb ~/.Xresources`
to apply the theme in the next terminals you will open.

If you are interested in how X clients configuration works.
Have a look [here](https://wiki.archlinux.org/index.php/x_resources).

I also use [`undistract-me`](https://github.com/jml/undistract-me) to be able to run long standing command, do something else while it's running and get notified when the command is finished. If you want to get it working, you need to install `zsh-notify` and `wmctrl` packages.

There are some homemade commands, aliases and environement variables definitions in the [groovy_functions.sh](https://github.com/groovytron/dotfiles/blob/master/groovy_functions.sh) and [groovy_variables.sh](https://github.com/groovytron/dotfiles/blob/master/groovy_variables.sh) files.

## Terminal multiplexing

- [`tmux`](https://github.com/tmux/tmux/wiki) as a terminal multiplexer with
  both of the above shells. Check the `.tmux.conf` file for settings details.
- [`tpm`](https://github.com/tmux-plugins/tpm) which stands for Tmux Plugin Manager.
- [`tmux-powerline-theme`](https://github.com/jooize/tmux-powerline-theme)
- [`tmuxinator`](https://github.com/tmuxinator/tmuxinator) to speed up project startup with `tmux` using «per-project configurations»

## Editors

I am now using [`neovim`](https://neovim.io/) because it has a built-in support
for [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/)
and makes code editing and debugging easier. Feel free to have a look at
my configuration in [config/nvim](https://github.com/groovytron/dotfiles/tree/master/config/nvim)
to check which plugins I am using and how they are configured.

I used to use `gvim` in the past for a few years with the following config:

- [`vim` (the `gvim` package with GTK/X11 support)](http://www.vim.org/) with some plugins (check the [.vimrc](https://github.com/groovytron/dotfiles/blob/master/.vimrc))
- [`vim-airline`](https://github.com/vim-airline/vim-airline) to style vim's status bar

## CLI Tools

- [`ag`](https://github.com/ggreer/the_silver_searcher) and
  [`ripgrep`](https://github.com/BurntSushi/ripgrep) as more user-friendly and
  faster alternatives to `grep`
- [`bat`](https://github.com/sharkdp/bat) as a replacement for `cat`
- [`glow`](https://github.com/charmbracelet/glow) to read Markdown files in the terminal
- [`fzf`](https://github.com/junegunn/fzf) as a command-line fuzzy finder an pluggable to vim
- [`zathura`](https://pwmt.org/projects/zathura/) as a document viewer (have a look at my [zathurarc](https://github.com/groovytron/dotfiles/blob/master/zathurarc) to check the configuration)
- [`dog`](https://github.com/ogham/dog) as a DNS client for DNS debugging

## Fonts

I used to use the [patched fonts for Powerline](https://github.com/powerline/fonts) to get all the characters displayed nicely in the shells.

I now use [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) and its font patcher to patch it with the font [Input Mono from Font Bureau](https://input.fontbureau.com/). It makes the fonts usable in Vim with all the icons from Nerd Fonts.

The command I use to generate the font is the following:

```console
python font-patcher --mono InputMono-Regular.ttf
```

## Result

Here is how it looks with zsh, tmux and vim configured with the solarized theme:

![](./urxvt-with-tmux-vim-1100x601.png)
