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
      printf 'ok, everything should be good :)\n'
    else
      printf "direnv doesn't seem to exist; make sure it's installed :)\n"
    fi
}
