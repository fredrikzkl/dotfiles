## Dotfiles for Fred

Managed with GNU stow. Packages: `zsh`, `nvim` (LazyVim), `ghostty`, `lazygit`, `tmux`.

### Fresh Mac setup

One-liner — installs Homebrew, all CLI tools, Ghostty, a Nerd Font, oh-my-zsh, clones this repo to `~/.dotfiles`, stows everything, and bootstraps LazyVim plugins:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/fredrikzkl/dotfiles/main/install.sh)"
```

Or clone first, then run:

```sh
git clone https://github.com/fredrikzkl/dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

Xcode Command Line Tools are installed on first run via a GUI prompt — accept it, then re-run the script.

### Sync an existing Mac

Re-run the installer. It's idempotent: pulls latest, re-stows, re-syncs plugins.

```sh
~/.dotfiles/install.sh
```

### What gets installed

- **Brew formulae:** `stow git neovim tmux lazygit ripgrep fd fzf zoxide node gh jq curl wget`
- **Brew casks:** `ghostty`, `font-jetbrains-mono-nerd-font`
- **oh-my-zsh** (unattended, keeps the stowed `.zshrc`)
- **LazyVim** — the config lives in `nvim/.config/nvim/`; plugins are synced headlessly on install

### Manual stow

If you want to re-stow a single package without running the installer:

```sh
cd ~/.dotfiles
stow --restow --target=$HOME zsh
```

Conflicting real files (`~/.zshrc`, `~/.tmux.conf`) are moved to `~/.dotfiles-backup/<timestamp>/` automatically by the installer.
