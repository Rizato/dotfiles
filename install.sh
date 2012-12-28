#! /bin/bash

cd `dirname $0`

for file in *; do
    if [[ $file == `basename $0` ]]; then
        continue
    fi

    ln -snfT `pwd`/$file $HOME/.$file
done

