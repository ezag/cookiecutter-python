[![builds.sr.ht status](
{{ cookiecutter.build_url }}.svg)](
{{ cookiecutter.build_url }})

- [Home       ]({{ cookiecutter.repo_url }})
- [API Docs   ]({{ cookiecutter.man_url }})
- [Tickets    ]({{ cookiecutter.todo_url }})
- [MIT License]({{ cookiecutter.repo_url }}/tree/main/item/LICENSE)

# Misc

```shell
cd ..
rm -rf python-syaconf
cookiecutter --default-config gh:ezag/cookiecutter-python
cd python-syaconf
git init
git remote add origin git@git.sr.ht:~zag/python-syaconf
git add .
git commit -m "Initial commit"
git push -u origin main -f
bin/reset-venv.sh
venv/bin/syaconf
venv/bin/tox -s true
```
