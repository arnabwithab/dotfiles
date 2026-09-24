# dotfiles

Personal machine config: shell, Hyprland rice, AI tooling.

## Setup a fresh machine

```bash
git clone https://github.com/arnabwithab/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` symlinks everything into `$HOME` and skips any file that already exists (never overwrites). Re-run safe.

## What's inside

| Path | What |
|------|------|
| `.zshrc`, `.zshenv`, `.zprofile`, `.bashrc`, `.profile` | shell |
| `.gitconfig` | git (GPG sign, LFS, pull.rebase) |
| `.config/hypr` | Hyprland, hyprlock, hypridle |
| `.config/waybar`, `rofi`, `kitty` | bar, launcher, terminal |
| `.config/{fastfetch,btop,swaync,wlogout,wallust,cava,conky}` | utilities / theming |
| `.claude/`, `.config/opencode/`, `.codex/`, `.agents/` | AI tool configs + skills |

## Prerequisites (not in repo)

Install these yourself — the configs expect them:

- zsh + [oh-my-zsh](https://ohmyz.sh/) (`agnosterzak` theme, autosuggestions, syntax-highlighting)
- `lsd`, `fastfetch`, `bun`, `nvm`, `conda` (or strip those lines from `.zshrc`)
- Hyprland stack (hyprland, hyprlock, hypridle, waybar, rofi-wayland, kitty)
- rustup / cargo (sourced in shell)
- git-lfs, gpg (for commit signing)

## Never in this repo

Secrets stay out: `~/.ssh`, `~/.gnupg`, `~/.aws`, `.npmrc`, `client_secret.json`, `gh`/`docker`/`kaggle`/`rclone` auth, shell history, caches.

## Conventions

- Files live at the same relative path as in `$HOME` (e.g. repo `.config/hypr` → `~/.config/hypr`)
- Repo never overwrites existing files on install
- Add new config: copy/move into repo, re-run `install.sh` (or symlink manually), commit
