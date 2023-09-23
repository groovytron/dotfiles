GROOVY_BANNER=groovy_banner.sh
GROOVY_FUNCTIONS=groovy_functions.sh
GROOVY_VARIABLES=groovy_variables.sh

BANNER_SCRIPT=$(HOME)/$(GROOVY_BANNER)
FUNCTIONS_SCRIPT=$(HOME)/$(GROOVY_FUNCTIONS)
VARIABLES_SCRIPT=$(HOME)/$(GROOVY_VARIABLES)

GROOVY_UNIVERSE=$(BANNER_SCRIPT) $(FUNCTIONS_SCRIPT) $(VARIABLES_SCRIPT)

COMPLETION_FILES=completions

COMPLETION_FILES_INSTALL=$(HOME)/$(COMPLETION_FILES)

SHELL_UNIVERSE=$(GROOVY_UNIVERSE) $(COMPLETION_FILES_INSTALL)

BASH_PROFILE=.bash_profile
BASH_RC=.bashrc

BASH_PROFILE_INSTALL=$(HOME)/$(BASH_PROFILE)
BASH_RC_INSTALL=$(HOME)/$(BASH_RC)

GIT_PROMPT_INSTALL=$(HOME)/.bash/git-aware-prompt

ZSH_RC=.zshrc

ZSH_RC_INSTALL=$(HOME)/$(ZSH_RC)

TMUX_CONF=.tmux.conf
TMUX_CONF_INSTALL=$(HOME)/$(TMUX_CONF)

TPM_DIR=$(HOME)/.tmux/plugins
TPM_DIR_INSTALL=$(HOME)/.tmux/plugins/tpm

VIM_BUNDLE_DIR=$(HOME)/.vim/bundle
VUNDLE_INSTALL=$(VIM_BUNDLE_DIR)/Vundle.vim

VIMRC=.vimrc
VIMRC_INSTALL=$(HOME)/$(VIMRC)

ZATHURARC=zathurarc
ZATHURA_DIR=$(HOME)/.config/zathura
ZATHURARC_INSTALL=$(ZATHURA_DIR)/$(ZATHURARC)

LATEXMKRC=.latexmkrc
LATEXMKRC_INSTALL=$(HOME)/$(LATEXMKRC)

POETRY_FILE=config.toml
POETRY_CONFIG=config/poetry/$(POETRY_FILE)
POETRY_DIR=$(HOME)/.config/pypoetry
POETRY_INSTALL=$(POETRY_DIR)/$(POETRY_FILE)


NEOVIM_FILE=init.lua
NEOVIM_PLUGINS_FILE=plugins.lua
NEOVIM_CONFIG=config/nvim/$(NEOVIM_FILE)
NEOVIM_LUA_PLUGINS=config/nvim/lua
NEOVIM_PLUGINS_CONFIG=$(NEOVIM_LUA_PLUGINS)/$(NEOVIM_PLUGINS_FILE)
NEOVIM_DIR=$(HOME)/.config/nvim
NEOVIM_INSTALL=$(NEOVIM_DIR)/$(NEOVIM_FILE)

GIT_FLAGS=--quiet

help: ##- Show this help
	@sed -e '/#\{2\}-/!d; s/\\$$//; s/:[^#\t]*/: /; s/#\{2\}- *//' $(MAKEFILE_LIST)

.PHONY: install_all
install_all: ##- Install all the configurations
install_all: install_bash install_zsh install_tmux install_vim install_zathura install_latexmk install_poetry

.PHONY: install_bash
install_bash: ##- Install Bash configuration
install_bash: $(BASH_PROFILE_INSTALL)

.PHONY: install_zsh
install_zsh: ##- Install ZSH configuration
install_zsh: $(ZSH_RC_INSTALL)

.PHONY: install_tmux
install_tmux: ##- Install tmux configuration and TPM (Tmux Package Manager)
install_tmux: $(TMUX_CONF_INSTALL) $(TPM_DIR_INSTALL)

.PHONY: install_vim
install_vim: ##- Install Vim configuration and Vundle
install_vim: $(VIMRC_INSTALL)

.PHONY: install_zathura
install_zathura: ##- Install Zathura configuration
install_zathura: $(ZATHURARC_INSTALL)

.PHONY: install_latexmk
install_latexmk: ##- Install Latexmk configurartion
install_latexmk: $(LATEXMKRC_INSTALL)

.PHONY: install_poetry
install_poetry: ##- Install Poetry configurartion
install_poetry: $(POETRY_INSTALL)

.PHONY: install_neovim
install_neovim: ##- Install Neovim configurartion
install_neovim: $(NEOVIM_INSTALL)

$(BANNER_SCRIPT): $(GROOVY_BANNER)
	@echo 'Installing banner script...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Banner script installed.'

$(BASH_PROFILE_INSTALL): $(BASH_PROFILE) $(BASH_RC_INSTALL)
	@echo 'Installing .bash_profile script...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo '.bash_profile installed.'

$(BASH_RC_INSTALL): $(BASH_RC) $(GIT_PROMPT_INSTALL) $(SHELL_UNIVERSE)
	@echo 'Installing .bashrc script...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo '.bashrc script installed.' && \
		([ -e /etc/profile.d/undistract-me.sh ] || echo 'Install undistract-me.sh to finalize the installation or comment the line using it in your shell configuration file')

$(GIT_PROMPT_INSTALL):
	@echo 'Installing Git Aware Prompt for bash...' && \
		mkdir -p $(HOME)/.bash && \
		git clone $(GIT_FLAGS) https://github.com/jimeh/git-aware-prompt.git $@ && \
		echo 'Git Aware Prompt installed.'

$(FUNCTIONS_SCRIPT): $(GROOVY_FUNCTIONS)
	@echo 'Installing functions script...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Functions script installed.'

$(VARIABLES_SCRIPT): $(GROOVY_VARIABLES)
	@echo 'Installing environment variables script...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Environment variables script installed.'

$(ZSH_RC_INSTALL): $(ZSH_RC) $(SHELL_UNIVERSE)
	@echo 'Installing .zshrc  script...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'ZSH configuration installed. Do not forget to install zsh and oh-my-zsh to use this configuration.'

$(COMPLETION_FILES_INSTALL): $(COMPLETION_FILES)
	@echo 'Installing shell completion scripts...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Shell completion scripts installed.'

$(TPM_DIR_INSTALL):
	@echo 'Installing TPM...' && \
		mkdir -p $(TPM_DIR) && \
		git clone $(GIT_FLAGS) https://github.com/tmux-plugins/tpm $@ && \
		echo 'TPM installed.'

$(TMUX_CONF_INSTALL): $(TMUX_CONF)
	@echo 'Installing tmux configuration...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Tmux configuration installed.'

$(VIMRC_INSTALL): $(VIMRC) $(VUNDLE_INSTALL)
	@echo 'Installing vim configuration...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo "Vim configuration installed. Do not forget to open vim and run :PluginIntall to install plugins and fix errors. You can also run 'vim +PluginInstall +qall' to be quicker. Some softwares such as fzf might need to be installed as well to get some extra features working. See the README.md for details."

$(VUNDLE_INSTALL):
	@echo 'Installing Vundle...' && \
		mkdir -p $(VIM_BUNDLE_DIR) && \
		git clone $(GIT_FLAGS) https://github.com/VundleVim/Vundle.vim.git $@ && \
		echo 'Vundle installed.'

$(ZATHURARC_INSTALL): $(ZATHURARC)
	@echo 'Installing Zathura configuration...' && \
		mkdir -p $(ZATHURA_DIR) && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Zathura configuration installed.'

$(LATEXMKRC_INSTALL): $(LATEXMKRC)
	@echo 'Installing Latexmk configuration...' && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Latexmk configuration installed.'

$(POETRY_INSTALL): $(POETRY_CONFIG)
	@echo 'Installing Poetry configuration...' && \
		mkdir -p $(POETRY_DIR) && \
		ln -sf $(shell pwd)/$< $@ && \
		echo 'Poetry configuration installed.'

$(NEOVIM_INSTALL): $(NEOVIM_CONFIG)
	@echo 'Installing Neovim configuration...' && \
		mkdir -p $(NEOVIM_DIR)/lua && \
		ln -sf $(shell pwd)/$< $@ && \
		([ -e '~/.local/share/nvim/site/pack/packer/start/packer.nvim' ] && git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim || echo 0) && \
		ln -sf $(shell pwd)/config/nvim/lua/plugins.lua $(NEOVIM_DIR)/lua/plugins.lua && \
		echo 'Neovim configuration installed.'

install_terminal_theme:
	ln -sf $(shell pwd)/.Xresources.gruvbox $(HOME)/.Xresources

install_terminal_font:
	([ -e 'Input-Font.zip' ] && curl https://input.djr.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email= -O Input-Font.zip) || echo 0 && \
	unzip Input-Font.zip && \
	([ -e 'font-patcher' ] && wget https://github.com/ryanoasis/nerd-fonts/raw/master/font-patcher -O  font-patcher) || echo 0 && \
	python font-patcher --mono Input_Fonts/InputMono/InputMono/InputMono-Regular.ttf
