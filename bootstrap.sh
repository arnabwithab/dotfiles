#!/usr/bin/env bash
# Install system + tool prerequisites for these dotfiles. Re-run safe.
# Usage: ./bootstrap.sh
set -euo pipefail

log() { printf '\n==> %s\n' "$*"; }

# --- apt (Debian/Ubuntu) ---
if command -v apt-get >/dev/null; then
  log "apt packages"
  sudo apt-get update -qq
  sudo apt-get install -y -qq \
    zsh git git-lfs gpg curl wget lsd fastfetch \
    build-essential pipx
fi

# --- oh-my-zsh (if missing) ---
if [ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]; then
  log "oh-my-zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- nvm + node ---
if [ ! -s "${NVM_DIR:-$HOME/.nvm}/nvm.sh" ]; then
  log "nvm"
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# --- bun ---
if ! command -v bun >/dev/null; then
  log "bun"
  curl -fsSL https://bun.sh/install | bash
fi

# --- rustup / cargo ---
if [ ! -f "$HOME/.cargo/env" ]; then
  log "rustup"
  curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs | sh -s -- -y
fi

# --- miniconda ---
if [ ! -x "$HOME/miniconda3/bin/conda" ]; then
  log "miniconda"
  curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -o /tmp/miniconda.sh
  bash /tmp/miniconda.sh -b -p "$HOME/miniconda3"
  rm -f /tmp/miniconda.sh
fi

# --- zsh plugins (custom, outside oh-my-zsh tree) ---
ZSH_CUSTOM="${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}"
for repo in zsh-autosuggestions zsh-syntax-highlighting; do
  dest="$ZSH_CUSTOM/plugins/$repo"
  if [ ! -d "$dest" ]; then
    log "$repo"
    git clone -q --depth 1 \
      "https://github.com/zsh-users/$repo.git" "$dest"
  fi
done

log "done — run ./install.sh to symlink, then restart shell"
