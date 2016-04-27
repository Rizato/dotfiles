ifneq (,)
	This makefile requires GNU Make.
endif

IGNORE = . .git fonts
DOTFILES := $(filter-out $(IGNORE), $(shell find . -maxdepth 1 -type d -exec basename {} \;))

.PHONY: help dependencies install install dotfiles vim uninstall

help:
	@echo 'Run make install to install symlinks into your home directory.'

dependencies:
	sudo apt-get update && sudo apt-get install \
		curl \
		git \
		stow \
		vim

install: dotfiles vim fonts

dotfiles:
	echo $(DOTFILES)
	@$(foreach file, $(DOTFILES), stow -v -t $(HOME) $(file); )

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# Hack, ignore error about missing colorscheme
	echo | vim +PlugInstall +qa!

fonts:
	git clone https://github.com/powerline/fonts.git
	./fonts/install.sh

uninstall:
	@$(foreach file, $(DOTFILES), stow -v -t $(HOME) -D $(file); )

