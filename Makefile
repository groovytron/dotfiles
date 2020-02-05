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

.PHONY: full_install
full_install: install_bash install_zsh install_tmux install_vim

.PHONY: install_bash
install_bash: $(BASH_PROFILE_INSTALL)

.PHONY: install_zsh
install_zsh: $(ZSH_RC_INSTALL)

.PHONY: install_tmux
install_tmux: $(TMUX_CONF_INSTALL) $(TPM_DIR_INSTALL)

.PHONY: install_vim
install_vim: $(VIMRC_INSTALL)

$(BANNER_SCRIPT): $(GROOVY_BANNER)
	@ln -sf $(shell pwd)/$< $@

$(BASH_PROFILE_INSTALL): $(BASH_PROFILE) $(BASH_RC_INSTALL)
	@ln -sf $(shell pwd)/$< $@

$(BASH_RC_INSTALL): $(BASH_RC) $(GIT_PROMPT_INSTALL) $(SHELL_UNIVERSE)
	@ln -sf $(shell pwd)/$< $@ && \
		([ -e /etc/profile.d/undistract-me.sh ] || echo 'Install undistract-me.sh to finalize the installation or comment the line using it in your shell configuration file')

$(GIT_PROMPT_INSTALL):
	@mkdir -p $(HOME)/.bash && \
		git clone git://github.com/jimeh/git-aware-prompt.git $@

$(FUNCTIONS_SCRIPT): $(GROOVY_FUNCTIONS)
	@ln -sf $(shell pwd)/$< $@

$(VARIABLES_SCRIPT): $(GROOVY_VARIABLES)
	@ln -sf $(shell pwd)/$< $@

$(ZSH_RC_INSTALL): $(ZSH_RC) $(SHELL_UNIVERSE)
	@ln -sf $(shell pwd)/$< $@ && \
		echo 'ZSH configuration installed. Do not forget to install zsh and oh-my-zsh to use this configuration.'

$(COMPLETION_FILES_INSTALL): $(COMPLETION_FILES)
	@ln -sf $(shell pwd)/$< $@

$(TPM_DIR_INSTALL):
	mkdir -p $(TPM_DIR) && \
	git clone https://github.com/tmux-plugins/tpm $@

$(TMUX_CONF_INSTALL): $(TMUX_CONF)
	@ln -sf $(shell pwd)/$< $@

$(VIMRC_INSTALL): $(VIMRC) $(VUNDLE_INSTALL)
	@ln -sf $(shell pwd)/$< $@ && \
		echo 'Vim configuration installed. Do not forget to open vim and run :PluginIntall to install plugins and fix errors. Some softwares such as fzf might need to be installed as well to get some extra features working. See the README.md for details.'

$(VUNDLE_INSTALL):
	@mkdir -p $(VIM_BUNDLE_DIR) && \
		git clone https://github.com/VundleVim/Vundle.vim.git $@
