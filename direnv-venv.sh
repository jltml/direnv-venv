venv() {
    if command -v direnv &> /dev/null; then
      if [ ! -d ".venv" ]; then
        python3 -m venv .venv
        printf 'created new venv in `.venv`!\n'
      else
        printf 'the directory `.venv` already exists; skipping `python3 -m venv .venv`\n'
      fi
      if [[ ! -f ".venv/.gitignore" ]]; then
        printf "*\n" > .venv/.gitignore
        printf 'added gitignore file at `.venv/.gitignore`\n'
      else
        printf '`.venv/.gitignore` already exists\n'
      fi
      if [[ ! -f ".envrc" ]]; then
        touch .envrc
        printf 'created `.envrc`!\n'
      else
        printf '`.envrc` already exists\n'
      fi
      if [[ -z $(grep "source .venv/bin/activate" .envrc) ]]; then
        printf 'source .venv/bin/activate\n' >> .envrc
        printf 'added `source .venv/bin/activate` to `.envrc`\n'
      fi
      if [[ -z $(grep "unset PS1" .envrc) ]]; then
        printf 'unset PS1\n' >> .envrc
        printf 'added `unset PS1` to `.envrc`\n'
      fi
      direnv allow .
      if command -v ./.venv/bin/python3 &> /dev/null; then
        ./.venv/bin/python3 -m pip install --upgrade pip setuptools > /dev/null
        if [[ $? == 0 ]]; then
          printf 'upgraded pip and setuptools\n'
        else
          printf 'failed to update pip and/or setuptools!\n'
        fi
      else
        printf 'pip and setuptools not upgraded \n'
      fi
      printf 'ok, everything should be good :)\n\n'
    else
      printf "direnv doesn't seem to exist; make sure it's installed :)\n"
    fi
}
