#!/bin/bash -ev
rm -rf venv
python3 -m venv venv
venv/bin/pip -q install --upgrade pip
venv/bin/pip -q install -e .

if [ \( "$1" != "tests" \) -a \( "$1" != "docs" \) ]; then
    set +e  # grep will return non-zero when requirements are empty
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements.txt
    set -e
fi

if [ "$1" == "tests" ]; then
    venv/bin/pip -q install -e .[tests]
fi
if [ "$1" == "docs" ]; then
    venv/bin/pip -q install -e .[docs]
fi

if [ \( "$1" != "tests" \) -a \( "$1" != "docs" \) ]; then
    venv/bin/pip -q install -e .[tests,docs,dev]
    venv/bin/pip freeze | grep -v syaconf > requirements-dev.txt
    git add requirements*.txt
    git commit requirements*.txt -m "Auto freeze requirements - ./reset-venv.sh"
    venv/bin/pre-commit install
else
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }}
fi
