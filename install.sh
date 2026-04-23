#!/usr/bin/env bash
# Fresh Mac bootstrap: installs Homebrew, tools, oh-my-zsh, dotfiles, LazyVim.
# Safe to re-run. Usage:
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/fredrikzkl/dotfiles/main/install.sh)"
# or, if already cloned:
#   cd ~/.dotfiles && ./install.sh

set -euo pipefail

DOTFILES_REPO="https://github.com/fredrikzkl/dotfiles.git"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
STOW_PACKAGES=(zsh nvim ghostty lazygit tmux)

log()  { printf "\033[1;34m==>\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m!!\033[0m  %s\n" "$*" >&2; }

# 1. Xcode Command Line Tools (needed for git and compilers)
if ! xcode-select -p >/dev/null 2>&1; then
  log "Installing Xcode Command Line Tools (accept the GUI prompt, then re-run)..."
  xcode-select --install || true
  exit 1
fi

# 2. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Put brew on PATH for this shell (Apple Silicon vs Intel)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# 3. Brew formulae + casks
log "Installing brew packages..."
BREW_FORMULAE=(
  stow git neovim tmux lazygit
  ripgrep fd fzf zoxide
  node gh jq curl wget
)
BREW_CASKS=(
  ghostty
  font-jetbrains-mono-nerd-font
)

brew update

# Install formulae individually; skip if already installed, keep going on failure.
for f in "${BREW_FORMULAE[@]}"; do
  if brew list --formula --versions "$f" >/dev/null 2>&1; then
    log "  formula $f already installed — skipping"
  else
    brew install "$f" || warn "Failed to install $f (continuing)"
  fi
done

# Casks: if the app already exists but wasn't tracked by brew, --adopt takes it over.
for c in "${BREW_CASKS[@]}"; do
  if brew list --cask --versions "$c" >/dev/null 2>&1; then
    log "  cask $c already installed — skipping"
  else
    brew install --cask --adopt "$c" 2>/dev/null \
      || brew install --cask "$c" \
      || warn "Failed to install cask $c (continuing)"
  fi
done

# 4. oh-my-zsh (keep our .zshrc; don't launch zsh)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log "Installing oh-my-zsh..."
  RUNZSH=no KEEP_ZSHRC=yes CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Make zsh the login shell if it isn't already
if [[ "$SHELL" != *"/zsh" ]]; then
  log "Changing login shell to zsh..."
  chsh -s /bin/zsh || warn "Could not chsh; do it manually."
fi

# 5. Clone or update dotfiles
if [[ ! -d "$DOTFILES_DIR/.git" ]]; then
  log "Cloning dotfiles into $DOTFILES_DIR..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  log "Updating dotfiles..."
  git -C "$DOTFILES_DIR" pull --ff-only || warn "Could not fast-forward dotfiles."
fi

cd "$DOTFILES_DIR"

# 6. Back up files that would block stow, then stow each package
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
backup_if_real() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mkdir -p "$BACKUP_DIR"
    local dest="$BACKUP_DIR/$(basename "$target")"
    warn "Backing up existing $target -> $dest"
    mv "$target" "$dest"
  fi
}

# Known conflicts created by fresh-mac defaults / oh-my-zsh
backup_if_real "$HOME/.zshrc"
backup_if_real "$HOME/.tmux.conf"

log "Stowing dotfiles packages: ${STOW_PACKAGES[*]}"
for pkg in "${STOW_PACKAGES[@]}"; do
  stow -v --restow --target="$HOME" "$pkg"
done

# 7. Bootstrap LazyVim plugins headlessly
log "Bootstrapping LazyVim (headless plugin sync)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || warn "LazyVim sync had issues; open nvim to inspect."

log "Done. Open a new terminal (or 'exec zsh') to pick up everything."
