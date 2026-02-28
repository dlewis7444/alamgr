# Contributing to AlaMGR

AlaMGR is a personal-use tool. Contributions are welcome, but please read this first.

## Before opening a PR

- **Discuss new features in an issue first.** PRs that add features not discussed in an issue may be declined if they conflict with the core use-case or add complexity that isn't broadly useful.
- **Bug fixes and shellcheck/lint improvements** are always welcome without prior discussion.
- **Keep it single-file.** The whole launcher lives in `alamgr`. Do not split it into multiple files or add a build step.

## Guidelines

- Follow the existing code style (bash, `[[ ]]` conditionals, lowercase variable names).
- Run `shellcheck alamgr install.sh uninstall.sh` before submitting — the CI will catch failures.
- Update `CHANGELOG.md` under `[Unreleased]` with a brief description of the change.

## What may be declined

- Features that only apply to a specific personal setup.
- Changes that add new runtime dependencies beyond `alacritty`, `tmux`, `zenity`, `jq`, and `bash`.
- Rewrites of the architecture or introduction of a build step.

If in doubt, open an issue first.
