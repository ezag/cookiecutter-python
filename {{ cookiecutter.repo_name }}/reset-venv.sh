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

# TODO: define as CI requirements in setup.cfg
venv/bin/pip -q install tox

if [ "$1" != "ci" ]; then
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-ci.txt
    # TODO: define as development requirements in setup.cfg
    venv/bin/pip -q install pytest black ipython ipdb
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }} > requirements-dev.txt
    git add requirements*.txt
    git commit requirements*.txt -m "Upgrade requirements - ./reset-venv.sh"
else
    venv/bin/pip freeze | grep -v {{ cookiecutter.project_name }}
fi
