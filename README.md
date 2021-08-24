# direnv-venv

***venvs, but a little less annoying™***

![direnv-venv preview](https://user-images.githubusercontent.com/8261330/130555236-6a44a196-1ccc-498d-a859-21563a1c17fd.gif)

This is a super tiny shell script with a function that makes creating and using Python's venvs a little easier. Just run `venv` and you'll have a venv at `.venv` within your working directory, plus a `.envrc` file so that, thanks to the awesome [direnv](https://github.com/direnv/direnv), every time you `cd` into the directory your venv will automatically be activated. It's pretty snazzy, even if a very minor quality-of-life thing.

# Installation

0. First, make sure that you've [installed direnv](https://github.com/direnv/direnv/blob/master/docs/installation.md) and [hooked it into your shell](https://github.com/direnv/direnv/blob/master/docs/hook.md).

1. Then, for the actual thing: you can either…

…copy the script to somewhere and add the following line to your `.zshrc` or `.bash_profile` or whatever applicable file

```sh
source ~/path/to/direnv-venv.sh
```

…*or* you could be extra cool and use a plugin manager thingy like the really awesome [sheldon](https://github.com/rossmacarthur/sheldon), which I overenthusiastically love and highly recommend. In that case, add this to `~/.sheldon/plugins.toml`:

```toml
[plugins.direnv-venv]
github = "jltml/direnv-venv"
```

# Usage

```sh
venv
```

…that's it

I'm just realizing that this README is like three times longer than the function itself… haha
