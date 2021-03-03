#!/bin/sh -ev
rm -rf venv
python3 -m venv venv
venv/bin/pip -q install --upgrade pip
venv/bin/pip -q install -e .

if [ "$1" != "ci" ]; then
    set +e  # grep will return non-zero when requirements are empty
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements.txt
    set -e
fi

venv/bin/pip -q install -e .[ci]

if [ "$1" != "ci" ]; then
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-ci.txt
    venv/bin/pip -q install -e .[dev]
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-dev.txt
    git add requirements*.txt
    git commit requirements*.txt -m "Auto freeze requirements - ./reset-venv.sh"
    venv/bin/pre-commit install
else
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }}
fi
