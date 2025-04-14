#!/bin/bash

# Define the directories
OUT_DIR="out"
SRC_DIR="src"
INCLUDE_DIR="include"

# Check if the out directory exists, if not, create it
if [ ! -d "$OUT_DIR" ]; then
    echo "Creating directory: $OUT_DIR"
    mkdir -p "$OUT_DIR"
else
    echo "Directory already exists: $OUT_DIR"
fi

# Check if the src directory exists, if not, create it
if [ ! -d "$SRC_DIR" ]; then
    echo "Creating directory: $SRC_DIR"
    mkdir -p "$SRC_DIR"
else
    echo "Directory already exists: $SRC_DIR"
fi

# Check if the include directory exists, if not, create it
if [ ! -d "$INCLUDE_DIR" ]; then
    echo "Creating directory: $INCLUDE_DIR"
    mkdir -p "$INCLUDE_DIR"
else
    echo "Directory already exists: $INCLUDE_DIR"
fi

cmake -G "Ninja" .
ninja