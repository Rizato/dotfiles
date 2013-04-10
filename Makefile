ifneq (,)
	This makefile requires GNU Make.
endif

IGNORE = Makefile README.md patches
DOTFILES := $(filter-out $(IGNORE), $(wildcard *))

.PHONY: help install uninstall

help:
	@echo 'Run make install to install symlinks into your home directory.' \
		'This will replace any existing dotfiles that conflict with the' \
		'files in this directory.'

install:
	@$(foreach file, $(DOTFILES), ln -snfT $(CURDIR)/$(file) $(HOME)/.$(file); )

uninstall:
	@$(foreach file, $(DOTFILES), if [ -L $(HOME)/.$(file) ]; then rm $(HOME)/.$(file); fi; )

