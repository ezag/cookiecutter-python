#!/bin/bash -ev
mkdir -p build/docs
rm -rf build/docs/content
git clone . build/docs/content
cd build/docs/content
git remote add publish {{ cookiecutter.publish_url }}
git fetch publish
if git branch -a | grep remotes/publish/wiki; then
    git checkout wiki
else
    git checkout --orphan wiki
fi
git rm -rf .
cd -
venv/bin/pydoc-markdown
cd -
git add .
git commit -a -m "Auto commit - build-docs.sh"
git push -u publish wiki
