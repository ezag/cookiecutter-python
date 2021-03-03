#!/bin/sh -ev
rm -rf venv
python3 -m venv venv
venv/bin/pip -q install --upgrade pip
venv/bin/pip -q install -e .
set +e
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements.txt
set -e
# TODO: define as CI requirements in setup.cfg
venv/bin/pip -q install tox
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-ci.txt
# TODO: define as development requirements in setup.cfg
venv/bin/pip -q install pytest  # TODO: black ipython ipdb
venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-dev.txt
