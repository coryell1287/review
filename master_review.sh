#!/bin/bash

make_script_executable() {
    if [ ! -x "$1" ]; then
        chmod 755 "$1"
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

execute_setup() {
    if [ -x "$1" ]; then
        "$1"
    else
        chmod 755 "$1"
        "$1"
    fi
}

help() {
    echo "
   Execute script to start master review
   "
    echo "   Syntax: master-review [-l|r|]"
    echo "   options:"
    echo "   l          lesson"
    echo "   --list     List the different topics covered by the master review."
    echo "   --help     Help script to list out the commands."
}

error_message() {
    echo "
    Command not recognized. Type the following command if you are having trouble.
    
    master-review --help
 "
    exit 1
}

list_review_material() {
    echo "
    1). System Design
    2). Rest Architecture
    3). Authentication/Authorization
    4). TypeScript
        a). Fundamentals
        b). Recipes
    
    "
}

check_for_flags() {
    if [[ "$@" == "--help" && "$#" -eq 1 ]]; then
        echo "call the help text"
    elif [[ "$@" == "--list" && "$#" -eq 1 ]]; then
        list_review_material
    else
        echo ""
    fi
}

echo "$@"
check_for_flags "$@"


symlink=$(read_symbolic_link $(which master-review))
PS3="Please enter your choice: "
options=("System Design" "REST" "Auth" "TypeScript" "Cryptography" "Quit")
select opt in "${options[@]}"; do
    case $opt in
    "System Design")
        symlink=$(read_symbolic_link $(which master-review))
        execute_setup $symlink/architecture/"system_design.sh"
        break
        ;;
    "REST")
        execute_setup $symlink/backend/"rest.sh"
        break
        ;;
    "Auth")
        execute_setup $symlink/backend/"auth.sh"
        break
        ;;
    "TypeScript")
        execute_setup $symlink/typescript/"select.sh"
        break
        ;;
    "Cryptography")
        execute_setup $symlink/nodejs/"crypto.sh"
        break
        ;;
    "Quit")
        break
        ;;
    *) echo "invalid option $REPLY" ;;
    esac
done

#    1). System Design
#     2). Rest Architecture
#     3). Authentication/Authorization
#     3). Python
#         a). Data Structures
#         b). Algorithms
#         c). Minutes of code
#     4). TypeScript
#         a). Data Structures
#         b). Algorithms
#         c). 30 Seconds of code
    
#     "