ifneq (,)
	This makefile requires GNU Make.
endif

IGNORE = . .git fonts
DOTFILES := $(filter-out $(IGNORE), $(shell find . -maxdepth 1 -type d -exec basename {} \;))

.PHONY: help dependencies install install dotfiles vim neovim uninstall

help:
	@echo 'Run make install to install symlinks into your home directory.'

dependencies:
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update && sudo apt-get install \
		curl \
		git \
		neovim \
		python-dev \
		python-pip \
		python3-dev \
		python3-pip \
		silversearcher-ag \
		stow \
		vim

install: dotfiles vim neovim fonts

dotfiles:
	echo $(DOTFILES)
	@$(foreach file, $(DOTFILES), stow -v -t $(HOME) $(file); )

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# Hack, ignore error about missing colorscheme
	echo | vim +PlugInstall +qa!

neovim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ${HOME}/.config/nvim && ln -sf ../../.vimrc ${HOME}/.config/nvim
	# Hack, ignore error about missing colorscheme
	echo | nvim +PlugInstall +qa!
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	yes 0 | sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	yes 0 | sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	yes 0 | sudo update-alternatives --config editor
	echo

fonts:
	git clone https://github.com/powerline/fonts.git
	./fonts/install.sh

uninstall:
	@$(foreach file, $(DOTFILES), stow -v -t $(HOME) -D $(file); )

