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

### Dependencies

Ensure the following tools and frameworks are installed before applying the configurations:

1. **System Requirements**:
   - macOS (preferably the latest version for compatibility with `nix-darwin`).
   - Command Line Tools (run `xcode-select --install` if not already installed).

2. **Toolchain**:
   - [Nix](https://nixos.org/download.html): The package manager required to build and apply configurations.
   - [nix-darwin](https://github.com/LnL7/nix-darwin): Manages system-level configurations on macOS.
   - [Home Manager](https://github.com/nix-community/home-manager): Manages user-level configurations.

3. **File-Specific Dependencies**:
   - **`packages.nix`**:
     - Ensure the listed packages (e.g., `mkalias`, `nixpkgs-fmt`) are available in your Nix channels or overlays.
     - Review and customize the list to match your use case.
   - **`services.nix`**:
     - The `services.nix` file assumes the Nix Daemon (`nix-daemon`) is enabled.
   - **`zsh.nix`**:
     - Installs and configures Zsh. Ensure Zsh plugins such as `zsh-autosuggestions` are available.

4. **Optional Tools**:
   - **Spotlight Fix**: If using `spotlightFix.nix`, confirm it is compatible with the current macOS version and Spotlight configuration.
   - **Warp Theme**: Requires the Warp terminal to apply custom themes.

5. **Recommended Commands**:
   - Validate the configuration:

     ```bash
     nix flake check
     darwin-rebuild check
     ```

   - Apply the configuration:

     ```bash
     darwin-rebuild switch --flake ./path-to-dotfiles#hostname
     ```

---

### File Structure

- **`bootstrap.sh`**: Initial setup script.
- **`flake.nix`**: Core Nix configuration for managing packages and system settings.
- **`darwin/`**: MacOS-specific configurations, including Spotlight fixes.
- **`home-manager/`**: User-level configurations for dotfiles, packages, and themes.
- **`manual/`**: Additional resources and documentation for tools like Arc Browser and Raycast.

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
