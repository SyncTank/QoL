#!/bin/bash

# Define the directories
LIB_DIR="libs"
MISC_DIR="$LIB_DIR/Misc"
CDIR=$(pwd)
GDIR="$CDIR/$MISC_DIR"
declare -a libraries=(
    [0]=https://github.com/glfw/glfw.git #glfw window_context
    [1]=https://github.com/Immediate-Mode-UI/Nuklear.git #nuklear GUI_UI
    [2]=https://github.com/raysan5/raylib.git #raylib render
    [3]=https://github.com/ColleagueRiley/RGFW.git #rgfw window_context
    [4]=https://github.com/libsdl-org/SDL.git #sdl render
    [5]=https://github.com/nicbarker/clay.git #clay layout
)

# Check if the src directory exists, if not, create it
if [[ "$1" == "init" && $# -eq 1 ]]; then
    if [[ ! -d "$LIB_DIR" ]]; then
        echo "Creating directory: $LIB_DIR"
        mkdir -p "$LIB_DIR"
    else
        echo "Directory already exists: $LIB_DIR"
    fi

    if [ ! -d "$MISC_DIR" ]; then
        echo "Creating directory: $MISC_DIR"
        mkdir -p "$MISC_DIR"
    else
        echo "Directory already exists: $MISC_DIR"
    fi

    echo "Clone libraries into: $GDIR"
    cd $GDIR
    for i in ${libraries[@]}
    do
        echo "Cloning $i"
        git clone "$i"
    done
elif [[ $# -eq 0 || "$1" == "update" ]]; then
    if [ ! -d "$MISC_DIR" ]; then
        echo "Please run init to setup"
        exit 1
    else
        echo "Updating libraries found: $GDIR"
        cd $GDIR
        files=(*/)
        for dir in "${files[@]}"; do
            if [ -d "$dir/.git" ]; then
                echo "Updating: $dir"
                git -C "$dir" pull
            fi
        done
    fi
elif [[ ( "$1" == "help" || "$1" == "-h" || "$1" == "-help" ) && $# -eq 1 ]]; then
    echo "Help:"
    echo "  init: initializes the folders and projects in use" 
    echo "  update or empty for pulling git projects in use"
else
    echo "Pass a valid argument or leave empty"
fi
