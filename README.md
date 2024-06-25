# kickstart.nixvim

## Introduction

This repo is a personal project to learn Nix within NixOS while also learning/setting up [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
I have attempted to be as true to kickstart as possible while adding new and updated comments to help those learning Nix.

### Caveats

Nix does not lend itself to the same separation paradigms used by kickstart.nvim. The idea of keeping the configuration as a single file
similar to kickstart.nvim was originally planned but as I translated more of the init.lua over I found Nix lended itself better to a more
separated implementation. This means most plugins have their own .nix file that is imported into the base nixvim.nix file.

>**NOTE**
> This repo is a WORK IN PROGRESS
> I have about ~90% of the kickstart.nvim converted to Nix
> but this repo still requires a good amount of testing to confrim things are working as expected

# Installation

This installation process assumes you understand the basics of importing and adding dependencies to your .nix configuration file.
This installation process is also assumes you are running NixOS, this repo should work the same with a home-manager configuration not on NixOS but
I have not confirmed this yet.

## Installing Nixvim module

This repo is currently setup to be imported into your current NixOS/Home-Manager module. 
To setup the Nixvim module follow the step found [here](https://nix-community.github.io/nixvim/user-guide/install.html) under the **Usage as a module (NixOS, home-manager, nix-darwin)** section.

## Setting up this repo

>**NOTE**
> Backup your previous configuration (if any exists)
> This can be found on Linux under the path `$XDG_CONFIG_HOME/nvim` or `~/.config/nvim`

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can update and version control your own copy of kickstart.nixvim.
>**NOTE**
> This is not required but recommended so you can version control your own kickstart.nixvim configuration.
3. Clone kickstart.nixvim
  * If you created your own fork
    ```
    cd /etc/nixos/
    git clone https://github.com/<YOUR-GITHUB-USERNAME>/kickstart.nixvim.git
    ```
  * If you skipped creating a fork
    ```
    cd /etc/nixos/
    git clone https://github.com/JMartJonesy/kickstart.nixvim.git
    ```
4. Import nixvim.nix into your .nix configuration file
  * Example to import into configuration.nix
    ```
    
    ```
