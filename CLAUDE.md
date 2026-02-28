# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AlaMGR is a single-file Bash GUI launcher (`alamgr`) for Alacritty project sessions. It presents a zenity dialog to select or create host/project pairs, then opens an Alacritty window running tmux with two vertical panes on the target host.

## Install

```bash
./install.sh
```

Installs `alamgr` to `~/.local/bin/`, the `.desktop` entry to `~/.local/share/applications/`, and the icon to `~/.local/share/icons/hicolor/256x256/apps/`.

## Dependencies

`alacritty`, `tmux`, `zenity`, `jq`, `bash`

## Architecture

Everything lives in the single `alamgr` bash script. Key concepts:

- **History**: Stored as a JSON array at `~/.config/alamgr/history.json`. Each entry has `host`, `project`, and `last_used` fields. Managed with `jq`.
- **Host discovery**: Parsed from `~/.ssh/config` via an `awk` one-pass parser (`get_ssh_hosts`). Wildcards and bare IPs are skipped; configurable suffix (`ALAMGR_STRIP_SUFFIX`) is stripped. `local` is always available as a pseudo-host.
- **Session naming**: tmux session is named `host-project` (dots and slashes replaced with dashes). If no project, named `host-noproject`.
- **Launch**: For `local`, runs `alacritty ... -e bash -c "..."`. For remote hosts, runs `alacritty ... -e ssh -t host "..."`. The tmux command uses `new-session -A -s` to reattach if the session exists, then splits the window horizontally.
- **New project flow**: A `new_project` variable gates `mkdir -p` creation on the remote.

## Files

- `alamgr` — the main script (no build step; edit and run directly)
- `install.sh` — copies files into place and refreshes icon/desktop caches
- `alamgr.desktop` — XDG desktop entry
- `alamgr.png` — 256×256 application icon
