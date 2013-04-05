# mjkoo's dotfiles

Configuration files, mostly for easy personal access.

## Installation

Simply run `make install`, which will create symlinks to the configuration files
in the repository in your home directory. **This destructively updates the
configuration files already in your home directory, use with caution**. A
corresponding `make uninstall` is included which will remove the files in this
repository from your home directory if they are symlinks. Backups of the
original files are not currently maintained.

## Editing submodules

A weird scheme is used to manage modifications to the submodules of this
repository. Edit freely but don't commit as we don't have push permissions on
the main repositories and don't want to fork. Use `make genpatches` to generate
a series of quilt patches from your modifications, `make patch` and `make
unpatch` work as expected. Can now pull updates from main repository and merge
our changes outside of git.

Best solution I've been able to come up with, other than importing modules into
repository (superrepository), which may have actually been better but increases
redundancy.

## Credits

Wombat color scheme: https://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/
