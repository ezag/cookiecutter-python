#!/bin/sh
rm -rf venv
python -m venv venv
venv/bin/pip install --upgrade pip
venv/bin/pip install -e .
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements.txt
# TODO: define as CI requirements in setup.cfg
venv/bin/pip install tox
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-ci.txt
# TODO: define as development requirements in setup.cfg
venv/bin/pip install pytest  # TODO: black ipython ipdb
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-dev.txt
