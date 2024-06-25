# kickstart.nixvim

>**NOTE**
> This repo is a WORK IN PROGRESS
> I have about ~90% of the kickstart.nvim converted to Nix
> but this repo still requires a good amount of testing to confirm things are working as expected

## Introduction

This repo is a personal project to learn Nix within NixOS while also learning/setting up [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
I have attempted to be as true to kickstart as possible while adding new and updated comments to help those learning Nix.

### Caveats

1. Nix does not lend itself to the same separation paradigms used by kickstart.nvim. The idea of keeping the configuration as a single file
similar to kickstart.nvim was originally planned but as I translated more of the init.lua over I found Nix lended itself better to a more
separated implementation. This means most plugins have their own .nix file that is imported into the base nixvim.nix file.
2. I used as little lua code as possible in the .nix files but due to Nixvim being a relatively new Nix module not everything can be natively configured. Any lua code will slowly be removed as new Nixvim features come out that allow for native methods of configuation.
3. I did not include Lazy nor Mason as I felt those both went against the Nix philosophy of having all your dependencies installed and managed through the .nix files. While it is possible to confgiure Lazy in Nixvim the implementation is very limited at the moment. Further enhancements to Lazy which would allow lazy loading are being discussed [here](https://github.com/nix-community/nixvim/issues/421) and I may update this repo to use Lazy when this feature is implemented.

# Installation

This installation process assumes you understand the basics of importing and adding dependencies to your .nix configuration file.
This installation process is also assumes you are running NixOS, this repo should work the same with a home-manager configuration not on NixOS but
I have not confirmed this yet.

## Install External Dependencies

- Basic utils: `git`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `have_nerd_font` in `nixvim.nix` to true
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

## Installing Nixvim module

This repo is currently setup to be imported into your current NixOS/Home-Manager module. 
To setup the Nixvim module follow the step found [here](https://nix-community.github.io/nixvim/user-guide/install.html) under the **Usage as a module (NixOS, home-manager, nix-darwin)** section.

## Setting up kickstart.nixvim

>**NOTE**
> Backup your previous configuration (if any exists)
> This can be found on Linux under the path `$XDG_CONFIG_HOME/nvim` or `~/.config/nvim`

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can update and version control your own copy of kickstart.nixvim.
>**NOTE**
> This is not required but recommended so you can version control your own kickstart.nixvim configuration.
3. Clone kickstart.nixvim
    * If you created your own fork
      ```sh
      cd /etc/nixos/
      git clone https://github.com/<YOUR-GITHUB-USERNAME>/kickstart.nixvim.git
      ```
    * If you skipped creating a fork
      ```sh
      cd /etc/nixos/
      git clone https://github.com/JMartJonesy/kickstart.nixvim.git
      ```
4. Import nixvim.nix into your .nix configuration file
    * Example of the line to add into your configuration.nix (or home.nix if you are using home-manager) file
      ```nix
      imports = [
        ./kickstart.nixvim/nixvim.nix
      ];
      ```
5. Rebuild your NixOS configuration
   * Without using Flake
     ```sh
     nixos-rebuild switch
     ```
6. Confirm your init.lua file has been created as loads without errors
   * Open the generated init.lua file and confirm no error dialog appears when opening
     ```sh
     nvim ~/.config/nvim/init.lua
     ``` 

# FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, move your old configuration to
    `~/.config/nvim-backup` and create an alias:
    ```
    alias nvim-backup='NVIM_APPNAME="nvim-backup" nvim'
    ```
    When you run Neovim using `nvim-backup` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-backup`.
* What if I want to "uninstall" kickstart.nixvim:
   1. Remove nixvim.nix import from your configuration.nix (or home.nix) file
   2. Remove the kickstart.nixvim directory `rm -r /etc/nixos/kickstart.nixvim`
   3. Rebuild your NixOS configuration `nixos-rebuild switch`
   4. **Optional:** Move your previously backed up lua configuration files to `$XDG_CONFIG_HOME/nvim` or `~/.config/nvim`
