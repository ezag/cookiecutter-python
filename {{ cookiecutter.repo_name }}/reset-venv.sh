#!/bin/sh
rm -rf venv
python -m venv venv
venv/bin/pip install --upgrade pip
venv/bin/pip install -e .
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements.txt
# TODO: define as development/CI requirements in setup.cfg
venv/bin/pip install tox
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-ci.txt
