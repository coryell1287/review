#!/bin/bash


echo "
#########################
    TypeScipt Reviews
#########################
"


execute_setup() {
    if [ -x "$1" ]; then
        "$1"
    else
        chmod 755 "$1"
        "$1"
    fi
}

read_symbolic_link() {
    linkfile="$1"
    if [ ! -L "$linkfile" ]; then
        echo "$linkfile is not a simbolik link" >&2
        return 1
    fi
    until [ ! -L "$linkfile" ]; do
        lastlinkfile="$linkfile"
        linkfile=$(readlink "$lastlinkfile")
    done
    REVIEW_DIR=$(readlink "$lastlinkfile")
    printf "${REVIEW_DIR%/*}"
}

symlink=$(read_symbolic_link $(which master-review))
PS3="Select a TypeScript subject: "
options=("Fundamentals" "Recipes" "Quit")
select opt in "${options[@]}"; do
    case $opt in
    "Fundamentals")
        symlink=$(read_symbolic_link $(which master-review))
        execute_setup $symlink/typescript/"typescript_fundamentals.sh"
        break
        ;;
    "Recipes")
        execute_setup $symlink/typescript/"typescript_recipes.sh"
        break
        ;;
    "Quit")
        break
        ;;
    *) echo "invalid option $REPLY" ;;
    esac
done