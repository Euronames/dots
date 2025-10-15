# AI Assistant Guide for dots Repository# Repository Guide for AI Assistants# Repository Guide for AI Assistants# Repository Guide for AI Assistants

## Overview## Repository Purpose## Repository Purpose## Repository Purpose

This is a Nix-based system configuration repository for macOS, using nix-darwin and home-manager. It provides a declarative approach to managing both system-level and user-level configurations.This repository contains dotfiles and system configuration for macOS using Nix, Home Manager, and nix-darwin. It provides a declarative way to manage both system-level and user-level configurations.This repository contains dotfiles and system configuration for macOS using Nix, Home Manager, and nix-darwin.This repository contains dotfiles and system configuration for macOS using Nix, Home Manager, and nix-darwin.

## Key Technologies## Repository Structure## Repository Structure## Repository Structure

- **nix-darwin**: System-level macOS configuration```nix```

- **home-manager**: User environment management

- **nix-flakes**: Dependency and configuration management.

- **homebrew**: Additional macOS package management

├── bootstrap.sh              # Initial setup script```plaintext.

## Repository Structure

├── flake.nix                # Main Nix flake configuration

```plaintext

dots/├── darwin/                  # macOS specific configurations.├── bootstrap.sh              # Initial setup script

├── darwin/                  # macOS System Configuration

│   ├── config.nix          # Main system configuration│   ├── config.nix          # Main darwin configuration

│   ├── environment.nix     # Environment variables

│   ├── homebrew.nix       # Homebrew integration│   ├── environment.nix     # Environment settings├── bootstrap.sh              # Initial setup script├── flake.nix                # Main Nix flake configuration

│   ├── system.nix         # System settings

│   ├── users.nix          # User definitions│   ├── homebrew.nix       # Homebrew package management

│   ├── assets/           # System assets

│   └── systemScripts/    # System-level scripts│   ├── system.nix         # System-level settings├── flake.nix                # Main Nix flake configuration├── darwin/                  # macOS specific configurations

│

├── home-manager/           # User Environment│   └── users.nix          # User configurations

│   ├── default.nix        # Main home-manager config

│   ├── dotfiles.nix       # Dotfile management├── home-manager/           # User environment management├── darwin/                  # macOS specific configurations│   ├── config.nix          # Main darwin configuration

│   ├── packages.nix       # User packages

│   ├── config/           # App configurations│   ├── default.nix        # Main home-manager configuration

│   │   ├── fish.nix     # Fish shell config

│   │   ├── ghostty      # Terminal config│   ├── dotfiles.nix       # Dotfile linking configuration│   ├── config.nix          # Main darwin configuration│   ├── environment.nix     # Environment settings

│   │   ├── git.nix      # Git config

│   │   └── ...          # Other tools│   ├── packages.nix       # User-specific packages

│   └── userScripts/     # User-level scripts

││   └── config/            # Application configurations│   ├── environment.nix     # Environment settings│   ├── homebrew.nix       # Homebrew package management

├── manual/                # Documentation

│   ├── fish/            # Shell docs│       ├── fish.nix      # Fish shell configuration

│   └── raycast/         # Raycast configs

││       ├── ghostty       # Terminal emulator config│   ├── homebrew.nix       # Homebrew package management│   ├── system.nix         # System-level settings

├── bootstrap.sh          # Initial setup script

├── flake.nix            # Main flake config│       ├── git.nix       # Git configuration

└── flake.lock           # Dependency pins

```│       ├── lazygit.nix   # LazyGit configuration│   ├── system.nix         # System-level settings│   └── users.nix          # User configurations



## Configuration Guide│       └── ...           # Other tool configurations



### System Configuration (`darwin/`)└── manual/                # Additional configuration files│   └── users.nix          # User configurations├── home-manager/           # User environment management



1. **Main Components**:    ├── fish/             # Fish shell documentation

   - `config.nix`: Core system settings

   - `environment.nix`: System-wide environment variables    ├── raycast/          # Raycast automation scripts├── home-manager/           # User environment management│   ├── default.nix        # Main home-manager configuration

   - `homebrew.nix`: Homebrew package management

   - `system.nix`: macOS system preferences    └── zen browser/      # Browser configurations

   - `users.nix`: User account configuration

```│   ├── default.nix        # Main home-manager configuration│   ├── dotfiles.nix       # Dotfile linking configuration

2. **Assets and Scripts**:

   - `assets/`: System resources (wallpapers, etc.)

   - `systemScripts/`: System-level automation

## System Components│   ├── dotfiles.nix       # Dotfile linking configuration│   ├── packages.nix       # User-specific packages

### User Configuration (`home-manager/`)



1. **Core Files**:

   - `default.nix`: Main home-manager configuration### Nix Flake│   ├── packages.nix       # User-specific packages│   └── config/            # Application configurations

   - `dotfiles.nix`: Manages symlinks to config files

   - `packages.nix`: User-specific package declarations



2. **Application Configs**:- **Purpose**: Central configuration management│   └── config/            # Application configurations│       ├── fish.nix      # Fish shell configuration

   - Located in `config/`

   - Each tool has its own .nix file- **Key Files**:

   - Configurations are modular and focused

  - `flake.nix`: Main system configuration│       ├── fish.nix      # Fish shell configuration│       ├── ghostty       # Terminal emulator config

## Common Operations

  - `flake.lock`: Dependency version pinning

### System Updates

│       ├── ghostty       # Terminal emulator config│       ├── git.nix       # Git configuration

```bash

# Rebuild system configuration### Darwin Configuration

sudo darwin-rebuild switch --flake .#MacBook-Pro

│       ├── git.nix       # Git configuration│       ├── lazygit.nix   # LazyGit configuration

# Update flake dependencies

nix flake update- **Location**: `/darwin`

```

- **Manages**:│       ├── lazygit.nix   # LazyGit configuration│       └── ...           # Other tool configurations

### Configuration Changes

- System settings and preferences

1. **System Changes**:

   - Edit relevant files in `darwin/`  - Environment variables│       └── ...           # Other tool configurations└── manual/                # Additional configuration files

   - Rebuild with darwin-rebuild

- Homebrew integration

2. **User Changes**:

   - Modify files in `home-manager/`  - User management└── manual/                # Additional configuration files    ├── fish/             # Fish shell documentation

   - Changes apply on next rebuild

- System-level scripts

## Development Guidelines

    ├── fish/             # Fish shell documentation    ├── raycast/          # Raycast automation scripts

### Adding New Configurations

### Home Manager

1. Choose the correct location:

   - System-wide: `darwin/`    ├── raycast/          # Raycast automation scripts    └── zen browser/      # Browser configurations

   - User-specific: `home-manager/`

   - Documentation: `manual/`- **Location**: `/home-manager`

2. Follow existing patterns:- **Handles**:    └── zen browser/      # Browser configurations```

   - Use descriptive names

   - Keep configurations modular  - Dotfile management

   - Add inline documentation

- User packages```

### Best Practices

- Application configurations

1. **Code Organization**:

   - One feature per file  - Shell environments (Fish, Zsh)## Key Components

   - Clear file naming

   - Consistent formatting  - Development tools

2. **Testing**:## Key Components

   - Test changes before committing

   - Verify symlinks work correctly## Common Operations

   - Check for side effects

### 1. Nix Flake Configuration

## Troubleshooting

### System Management

### Common Issues

### 1. Nix Flake Configuration- **Purpose**: Central configuration management

1. **Broken Symlinks**:

   - Check paths in `dotfiles.nix````bash

   - Verify file permissions

   - Ensure source files exist# Rebuild system configuration- **Key Files**:

2. **Build Failures**:sudo darwin-rebuild switch --flake .#MacBook-Pro

   - Validate Nix syntax

   - Check `flake.lock` updates- **Purpose**: Central configuration management  - `flake.nix`: Defines the system configuration

   - Review error messages

# Update flake inputs

### Debug Steps

nix flake update- **Key Files**:  - `flake.lock`: Pins dependency versions

1. Check system logs

2. Verify file permissions```

3. Validate configuration syntax

4. Test with --show-trace flag- `flake.nix`: Defines the system configuration

## Additional Information### Configuration Management

### File Naming Conventions- `flake.lock`: Pins dependency versions### 2. Darwin Configuration

- `.nix` files for Nix configurations- Dotfiles are managed through `home-manager/dotfiles.nix`

- Configuration files match their application names

- Scripts use descriptive, lowercase names- App configs are stored in `home-manager/config/`- **Location**: `/darwin`

### Important Notes- System scripts reside in `darwin/systemScripts/`

- Configurations are macOS-specific### 2. Darwin Configuration- **Components**

- Supports both Intel and Apple Silicon

- Uses flake-based Nix configuration## Development Guidelines

- Integrates with Homebrew via nix-homebrew

- System settings

## Resources

### Adding Configurations

- [Nix Manual](https://nixos.org/manual/nix/stable/)

- [Home Manager Manual](https://nix-community.github.io/home-manager/)- **Location**: `/darwin`  - Environment variables

- [Nix Darwin Documentation](https://github.com/LnL7/nix-darwin)

- [Nix Packages Search](https://search.nixos.org/)1. Choose the appropriate location:

  - User-level: `home-manager/config/`- **Components**:  - Homebrew integration

  - System-level: `darwin/`

  - Documentation: `manual/`  - System settings  - User management

2. Follow existing patterns:  - Environment variables

   - Use `.nix` extension for Nix configurations

   - Keep configurations modular  - Homebrew integration### 3. Home Manager

   - Document changes inline

- User management- **Location**: `/home-manager`

### Testing Changes

- **Features**:

1. Validate Nix syntax

2. Test configuration rebuild### 3. Home Manager  - Dotfile management

3. Verify expected behavior

4. Check for side effects- User package installation

## Important Notes- **Location**: `/home-manager`  - Application configurations

### Environment- **Features**:  - Shell environments

- Specifically configured for macOS  - Dotfile management

- Uses nix-darwin for system management

- Integrates with Homebrew through nix-homebrew  - User package installation## Common Operations

- Supports both Intel and Apple Silicon

  - Application configurations

### Best Practices

- Shell environments### System Management

- Keep configurations modular and focused

- Document significant changes```bash

- Follow consistent formatting in .nix files

- Test changes before committing## Common Operations# Rebuild system configuration

- Use descriptive commit messages

sudo darwin-rebuild switch --flake .#MacBook-Pro

## Troubleshooting

### System Management

- Check `flake.lock` for dependency versions

- Verify file permissions for linked dotfiles# Update flake inputs

- Ensure correct paths in dotfiles.nix

- Validate Nix syntax before rebuilding```bashnix flake update

- Check system logs for errors

# Rebuild system configuration```

## Additional Resources

sudo darwin-rebuild switch --flake .#MacBook-Pro

- [Home Manager Manual](https://nix-community.github.io/home-manager/)

- [Nix Darwin Documentation](https://github.com/LnL7/nix-darwin)### File Management

- [Nix Manual](https://nixos.org/manual/nix/stable/)

- [Nix Package Search](https://search.nixos.org/)# Update flake inputs- Dotfiles are managed through `home-manager/dotfiles.nix`

nix flake update- Configuration files are stored in `home-manager/config/`

```- System scripts are in `darwin/systemScripts/`

### File Management## Development Guidelines

- Dotfiles are managed through `home-manager/dotfiles.nix`### Adding New Configurations

- Configuration files are stored in `home-manager/config/`1. Place configuration files in appropriate directories:

- System scripts are in `darwin/systemScripts/`   - User configs → `home-manager/config/`

  - System configs → `darwin/`

## Development Guidelines   - Documentation → `manual/`

### Adding New Configurations### Modifying Existing Configurations

1. Respect the existing file structure

1. Place configuration files in appropriate directories:2. Update relevant .nix files

   - User configs → `home-manager/config/`3. Test changes with darwin-rebuild

   - System configs → `darwin/`

   - Documentation → `manual/`## Important Notes

### Modifying Existing Configurations### Environment

- Configured specifically for macOS

1. Respect the existing file structure- Uses nix-darwin for system management

2. Update relevant .nix files- Integrates with Homebrew through nix-homebrew

3. Test changes with darwin-rebuild

### Best Practices

## Important Notes- Keep configurations modular

- Document significant changes

### Environment- Use consistent formatting in .nix files

- Test changes before committing

- Configured specifically for macOS

- Uses nix-darwin for system management## Troubleshooting

- Integrates with Homebrew through nix-homebrew- Check `flake.lock` for dependency versions

- Verify file permissions for linked dotfiles

### Best Practices- Ensure correct paths in dotfiles.nix

- Validate nix syntax before rebuilding

- Keep configurations modular

- Document significant changes## Additional Resources

- Use consistent formatting in .nix files- [Home Manager Documentation](https://nix-community.github.io/home-manager/)

- Test changes before committing- [Nix Darwin Documentation](https://github.com/LnL7/nix-darwin)

- [Nix Manual](https://nixos.org/manual/nix/stable/)

## Troubleshooting

- Check `flake.lock` for dependency versions
- Verify file permissions for linked dotfiles
- Ensure correct paths in dotfiles.nix
- Validate nix syntax before rebuilding

## Additional Resources

- [Home Manager Documentation](https://nix-community.github.io/home-manager/)
- [Nix Darwin Documentation](https://github.com/LnL7/nix-darwin)
- [Nix Manual](https://nixos.org/manual/nix/stable/)
