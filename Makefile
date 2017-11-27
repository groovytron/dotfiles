.PHONY: git-prompt vundle airline-fonts

git-prompt:
	mkdir ~/.bash
	cd ~/.bash
	git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
	cd ~

vundle:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

airline-fonts:
	git clone https://github.com/powerline/fonts.git --depth=1
	sh ./fonts/install.sh
	rm -rf fonts
