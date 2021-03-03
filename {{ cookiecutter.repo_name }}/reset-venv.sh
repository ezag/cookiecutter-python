#!/bin/sh
rm -rf venv
python -m venv venv
venv/bin/pip install --upgrade pip
venv/bin/pip install -e .
venv/bin/pip freeze > requirements.txt
