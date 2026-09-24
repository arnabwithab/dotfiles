#!/usr/bin/env bash
# Install symlinks from ~/dotfiles into $HOME. Safe to re-run.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME:?HOME not set}"

link() {
  local src="$DOTFILES/$1" dest="$HOME_DIR/$1"
  [ -e "$src" ] || return 0
  if [ -L "$dest" ]; then
    return 0
  elif [ -e "$dest" ]; then
    echo "skip (exists): $dest"
    return 0
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked: $dest"
}

# top-level
for f in .zshrc .zshenv .zprofile .bashrc .profile .gitconfig; do
  link "$f"
done

# config dirs
for d in hypr waybar rofi kitty fastfetch btop swaync wlogout wallust cava conky; do
  link ".config/$d"
done

# partial dirs / files
for f in .config/opencode/opencode.json .config/opencode/skills .config/opencode/agents \
         .agents/skills; do
  link "$f"
done

echo "done"
