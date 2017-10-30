#!/usr/bin/env bash

# Print usage help page
function usage() {
    echo "Usage: alacritty-set-theme [OPTION...] [THEME]     set theme"
    echo ""
    echo "Options:"
    echo "  -h, --help                               display this help"
    echo "  -l, --list                                     list themes"
}

# No arguments are passed in.
if [ "$#" -eq "0" ] ; then
    usage
# 1 argument is passed in.
elif [ "$#" -eq "1" ] ; then
    # If first argument is `-h` or `--help`, display help.
    if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
        usage
    # If first argument is `-l` or `--list`, list all themes.
    elif [ "$1" == "-l" ] || [ "$1" == "--list" ] ; then
        files=$(ls ~/.config/alacritty/themes)
        for file in $files ; do
            name="${file%.*}"
            extension="${file##*.}"
            if [ "$extension" == "yml" ] ; then
                echo "  ${name}"
            fi
        done
    else
        filename=~/.config/alacritty/themes/${1}.yml
        if [ -e $filename ] ; then
            cat ~/.config/alacritty/alacritty-core.yml > ~/.config/alacritty/alacritty.yml
            cat $filename >> ~/.config/alacritty/alacritty.yml
        else
            echo "  Error: Theme '${1}' not found!"
        fi
    fi
fi

