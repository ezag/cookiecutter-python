#!/bin/bash -ev
mkdir -p build/docs
rm -rf build/docs/content
git clone . build/docs/content
cd build/docs/content
git checkout --orphan wiki
git rm -rf .
cd -
venv/bin/pydoc-markdown
cd -
git add .
git commit -a -m "Auto commit - build-docs.sh"
git remote add publish {{ cookiecutter.publish_url }}
git push -u publish wiki
