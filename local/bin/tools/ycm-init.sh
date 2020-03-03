#!/usr/bin/env sh

PYTHON = python3

#cd $_PWD_

$PYTHON -m venv ./venv

source ./venv/bin/activate

$PYTHON ./install.py --clang-completer
