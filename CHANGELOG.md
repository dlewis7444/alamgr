# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-02-27

### Added
- `VERSION="1.0.0"` variable in script; `--version` and `--help` flag handling
- `LICENSE` file (MIT, Copyright © 2025 David Lewis)
- `uninstall.sh` script to remove installed files and refresh caches
- `CHANGELOG.md` (this file)
- `CONTRIBUTING.md` with contribution guidelines
- GitHub Actions workflow (`.github/workflows/shellcheck.yml`) for shellcheck CI on every push and PR
- `screenshot.png` of the main selection dialog; referenced in README
- `ALAMGR_DEV_ROOT` environment variable (default `$HOME/dev`) replacing all hardcoded `~/dev` references
- `ALAMGR_STRIP_SUFFIX` environment variable replacing hardcoded suffix stripping
- Dependency preflight check in `install.sh`; graceful cache-update commands
- Atomic history writes via `mktemp` + `mv`; `zenity --error` on jq parse failure
- `new_project=false` initialisation guard at top of main section
- `Terminal=false`, `Version=1.5`, `Keywords=`, and `StartupNotify=true` to `.desktop` file
- `StrictHostKeyChecking=yes` for project-probe SSH call with helpful error dialog on key mismatch
- Platform note, "How it works" walkthrough, Configuration section, and Uninstall section in README
- Alamgr icon passed to launched Alacritty windows

### Changed
- Renamed project from `projlauncher` to `alamgr`/`AlaMGR`
- Selector columns reordered to Project / Host for clarity
- Local project listing switched from `ls -1` to `find … -printf '%f\n' | sort` (safer, no newline issues)
- History directory created with mode 700 regardless of caller's umask
- tmux session name sanitization strengthened to whitelist `[a-zA-Z0-9_-]` (replaces any other character with `-`)

### Fixed
- Shell injection via `$project` in `cd_cmd`: project is now shell-quoted with `printf '%q'`
- Duplicate pane when reattaching to an existing tmux session
- `install.sh` and `uninstall.sh` cache-update commands no longer abort with `set -e` when tools are absent

## [Unreleased]

[1.0.0]: https://github.com/dlewis7444/alamgr/releases/tag/v1.0.0
