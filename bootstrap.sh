#!/usr/bin/env bash

set -e          # Exit on error
set -u          # Treat unset variables as an error
set -o pipefail # Exit on first failed command in a pipeline

echo "🚀 Starting bootstrap script..."

# Ensure we are in the repo root
cd "$(dirname "$0")"

# --- 1. Install Nix ---
if ! command -v nix >/dev/null; then
  echo "📦 Installing Nix..."
  curl -L https://nixos.org/nix/install | sh
  # shellcheck disable=SC1090
  . ~/.nix-profile/etc/profile.d/nix.sh
else
  echo "✅ Nix is already installed."
fi

# --- 2. Enable Flakes and Experimental Features ---
echo "🔧 Configuring Nix..."
mkdir -p ~/.config/nix
cat <<EOF >~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF

# --- 3. Install nix-darwin ---
if ! command -v darwin-rebuild >/dev/null; then
  echo "🍏 Installing nix-darwin..."
  nix run nixpkgs#darwin-rebuild switch --flake .#MacBook-Pro
else
  echo "✅ nix-darwin is already installed."
fi

# --- 4. Apply System Configurations ---
echo "⚙️ Applying dotfile configurations..."
sudo darwin-rebuild switch --flake .#MacBook-Pro

# --- 5. Verify Installation ---
echo "✅ Installation complete! Verifying setup..."
nix --version

if command -v darwin-rebuild >/dev/null; then
  echo "✅ nix-darwin is installed: $(command -v darwin-rebuild)"
else
  echo "❌ nix-darwin is not installed!"
fi

echo "🚀 Bootstrap complete! Restart your terminal for full effect."
