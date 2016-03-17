ifneq (,)
	This makefile requires GNU Make.
endif

IGNORE = Makefile README.md
DOTFILES := $(filter-out $(IGNORE), $(wildcard *))

.PHONY: help install install dotfiles vim uninstall

help:
	@echo 'Run make install to install symlinks into your home directory.' \
		'This will replace any existing dotfiles that conflict with the' \
		'files in this directory.'

install: dotfiles vim fonts

dotfiles:
	@$(foreach file, $(DOTFILES), ln -snfT $(CURDIR)/$(file) $(HOME)/.$(file); )

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# Hack, ignore error about missing colorscheme
	echo | vim +PlugInstall +qa!

fonts:
	git clone https://github.com/powerline/fonts.git fonts
	./fonts/install.sh

uninstall:
	@$(foreach file, $(DOTFILES), if [ -L $(HOME)/.$(file) ]; then rm $(HOME)/.$(file); fi; )

