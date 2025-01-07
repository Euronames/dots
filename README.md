## Dotfiles Configuration for macOS

This repository contains my personal dotfiles, customized for setting up and managing my macOS environment using [darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager).

### Features
- **MacOS Configuration**: Streamlined setup for macOS using Nix and Home Manager.
- **Package Management**: Includes a curated list of tools and applications.
- **Custom Dotfiles**: Configurations for Zsh, Starship, Warp, and more.

---

### How to Use

1. **Run Bootstrap Script**
   - Execute the `bootstrap.sh` script to install the necessary tools and dependencies.
     ```bash
     ./bootstrap.sh
     ```

2. **Rebuild System Configuration**
   - Apply the full configuration using `nix-darwin`:
     ```bash
     darwin-rebuild switch --flake ~/Projects/dotfiles#MacBook-Pro
     ```

3. **Manual Steps**
   - Import the Raycast configuration manually.
   - Apply the custom Norly theme for Warp:
     1. Open Warp.
     2. Navigate to **Settings > Themes**.
     3. Select or import the `norly.yaml` theme file.

---

### File Structure
- **`bootstrap.sh`**: Initial setup script.
- **`flake.nix`**: Core Nix configuration for managing packages and system settings.
- **`darwin/`**: MacOS-specific configurations, including Spotlight fixes.
- **`home-manager/`**: User-level configurations for dotfiles, packages, and themes.
- **`manual/`**: Additional resources and documentation for tools like Arc Browser and Raycast.

---

### Dependencies
Ensure the following tools are installed before proceeding:
- [Nix](https://nixos.org/download.html)
- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [Home Manager](https://github.com/nix-community/home-manager)

---

### Contributions and Acknowledgments
This setup is inspired by:
- [mg](https://github.com/mg/home-manager)
- [mhanberg](https://github.com/mhanberg/.dotfiles)
- [Smaug123](https://github.com/Smaug123/nix-dotfiles)
- [dustinlyons](https://github.com/dustinlyons/nixos-config)

---

### Troubleshooting
- If the `darwin-rebuild` command fails, verify your Nix installation and flake configuration.
- Check for updates to `nix-darwin` and `home-manager` to ensure compatibility with the latest macOS version.
"""
