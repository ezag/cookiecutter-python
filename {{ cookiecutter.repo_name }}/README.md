[![builds.sr.ht status](
{{ cookiecutter.build_url }}.svg)](
{{ cookiecutter.build_url }})

# Project Home

{{ cookiecutter.repo_url }}

# API Documentation #

{{ cookiecutter.docs_url }}/api-documentation.md

# Cookiecutter routines

```shell
cd ..
rm -rf python-syaconf
cookiecutter --default-config gh:ezag/cookiecutter-python
cd python-syaconf
git init
git config user.name 'Eugen Zagorodniy'
git config user.email 'e.zagorodniy@gmail.com'
git remote add origin git@git.sr.ht:~zag/python-syaconf
git add .
git commit -m "Initial commit"
git push -u origin main -f
./reset-venv.sh
venv/bin/syaconf
venv/bin/tox -s true
./publish-docs.sh
```
