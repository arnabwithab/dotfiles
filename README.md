# dotfiles

Personal machine config: shell, Hyprland rice, AI tooling.

## Setup a fresh machine

```bash
git clone https://github.com/arnabwithab/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh   # prerequisites
./install.sh     # symlink configs into $HOME
exec zsh
```

Both scripts are re-run safe. `install.sh` skips existing files (never overwrites).

## What's inside

| Path | What |
|------|------|
| `.zshrc`, `.zshenv`, `.zprofile`, `.bashrc`, `.profile` | shell |
| `.gitconfig` | git (GPG sign, LFS, pull.rebase) |
| `.config/hypr` | Hyprland, hyprlock, hypridle |
| `.config/waybar`, `rofi`, `kitty` | bar, launcher, terminal |
| `.config/{fastfetch,btop,swaync,wlogout,wallust,cava,conky}` | utilities / theming |
| `.claude/`, `.config/opencode/`, `.codex/`, `.agents/` | AI tool configs + skills |

## Prerequisites

`bootstrap.sh` installs: zsh, oh-my-zsh (+ autosuggestions/syntax-highlighting), lsd, fastfetch, git-lfs, gpg, nvm, bun, rustup/cargo, miniconda.

Not automated (distro-specific): Hyprland stack (hyprland, hyprlock, hypridle, waybar, rofi-wayland, kitty).

## Never in this repo

Secrets stay out: `~/.ssh`, `~/.gnupg`, `~/.aws`, `.npmrc`, `client_secret.json`, `gh`/`docker`/`kaggle`/`rclone` auth, shell history, caches.

## Conventions

- Files live at the same relative path as in `$HOME` (e.g. repo `.config/hypr` → `~/.config/hypr`)
- Repo never overwrites existing files on install
- Add new config: copy/move into repo, re-run `install.sh` (or symlink manually), commit
