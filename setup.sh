#!/bin/bash

set -e

if test -z "$CONDA_ROOT"; then
    if test -d "$HOME/miniconda3"; then
        CONDA_ROOT="$HOME/miniconda3"
    elif test -d "$HOME/anaconda3"; then
        CONDA_ROOT="$HOME/anaconda3"
    else
        echo "Can't infer conda installation root"
        exit 1
    fi
fi

echo "Using conda at $CONDA_ROOT"

source "$CONDA_ROOT/etc/profile.d/conda.sh"

conda create --name televisor python=3.12
conda activate televisor

conda install python-lsp-server click
pip install python-telegram-bot
