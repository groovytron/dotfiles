VUNDLE=$(HOME)/.vim/bundle/Vundle.vim
GIT_PROMPT=$(HOME)/.bash/git-aware-prompt
TPM=$(HOME)/.tmux/plugins/tpm
OH_MY_ZSH=$(HOME)/.oh-my-zsh
DIRCOLORS=$(HOME)/dircolors.256dark

.PHONY: git-aware-prompt
git-aware-prompt: $(GIT_PROMPT)

.PHONY: vundle
vundle: $(VUNDLE)

.PHONY: dir-colors
dir-colors: $(DIRCOLORS)

.PHONY: oh-my-zsh
oh-my-zsh: $(OH_MY_ZSH)

.PHONY: GIT
GIT: ; @which git > /dev/null

$(GIT_PROMPT): GIT
	mkdir -p ~/.bash \
		&& git clone git://github.com/jimeh/git-aware-prompt.git $@

$(VUNDLE): GIT POWERLINE_FONTS
	git clone https://github.com/VundleVim/Vundle.vim.git $@ \
		&& vim +PluginInstall +qall

.PHONY: powerline-fonts
powerline-fonts: GIT
	git clone https://github.com/powerline/fonts.git --depth=1 \
		&& sh ./fonts/install.sh \
		&& rm -rf fonts

$(DIRCOLORS):
	wget -O $@ \
		https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark

.PHONY: ZSH_INSTALLED
ZSH_INSTALLED: ; @which zsh > /dev/null

$(OH_MY_ZSH): GIT ZSH_INSTALLED $(DIRCOLORS) powerline-fonts
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

.PHONY: TMUX_INSTALLED
TMUX_INSTALLED: ; @which tmux > /dev/null

$(TPM): GIT TMUX_INSTALLED
	git clone https://github.com/tmux-plugins/tpm $@
