#ifneq (,)
#	This makefile requires GNU Make.
#endif

IGNORE = Makefile README.md patches
DOTFILES := $(filter-out $(IGNORE), $(wildcard *))

.PHONY: help install uninstall link patch unpatch genpatches

help:
	@echo 'Run make install to install symlinks into your home directory.' \
		'This will replace any existing dotfiles that conflict with the' \
		'files in this directory.'

install: | patch link unpatch

uninstall:
	@$(foreach file, $(DOTFILES), if [ -L $(HOME)/.$(file) ]; then rm $(HOME)/.$(file); fi; )

link:
	@$(foreach file, $(DOTFILES), ln -snfT $(CURDIR)/$(file) $(HOME)/.$(file); )

patch:
	@quilt push -a

unpatch:
	@quilt pop -a

genpatches:
	@git submodule foreach '\
		patch=$(CURDIR)/`basename $$name`.patch; \
		git diff | sed -re "s#([a|b])/#\1/$$path/#" > $$patch; \
		git reset --hard; \
		if [ -s $$patch ]; then quilt import -f $$patch; fi; \
		rm $$patch \
		'
