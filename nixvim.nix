{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    # Plugins
    ./plugins/gitsigns.nix
    ./plugins/which-key.nix
    ./plugins/telescope.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/nvim-cmp.nix
    ./plugins/mini.nix
    ./plugins/treesitter.nix
    # NOTE: Next step on your Neovim jouney: Add/Configure additional plugins for Kickstart
    #
    #  Here are some example plugins that I've included in the Kickstart repository.
    #  Uncomment any of the lines below to enable them (you will need to restart nvim).
    #
    ./plugins/kickstart/health.nix
    # ./plugins/kickstart/plugins/debug.nix
    # ./plugins/kickstart/plugins/indent-blankline.nix
    # ./plugins/kickstart/plugins/lint.nix
    # ./plugins/kickstart/plugins/autopairs.nix
    # ./plugins/kickstart/plugins/neo-tree.nix
    # NOTE: Next step add and configure your own plugins see https://nix-community.github.io/nixvim/
    # Add your plugins to ./plugins/custom/plugins and import them below
  ];

  /*
  =====================================================================
  ==================== READ THIS BEFORE CONTINUING ====================
  =====================================================================
  ========                                    .-----.          ========
  ========         .----------------------.   | === |          ========
  ========         |.-""""""""""""""""""-.|   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||   KICKSTART.NVIM   ||   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||                    ||   |-----|          ========
  ========         ||:Tutor              ||   |:::::|          ========
  ========         |'-..................-'|   |____o|          ========
  ========         `"")----------------(""`   ___________      ========
  ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
  ========       /:::========|  |==hjkl==:::\  \ required \    ========
  ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
  ========                                                     ========
  =====================================================================
  =====================================================================

  What is Kickstart?

    Kickstart.nvim is *not* a distribution.

    Kickstart.nvim is a starting point for your own configuration.
      The goal is that you can read every line of code, top-to-bottom, understand
      what your configuration is doing, and modify it to suit your needs.

      Once you've done that, you can start exploring, configuring and tinkering to
      make Neovim your own! That might mean leaving Kickstart just the way it is for a while
      or immediately breaking it into modular pieces. It's up to you!

      If you don't know anything about Lua, I recommend taking some time to read through
      a guide. One possible example which will only take 10-15 minutes:
        - https://learnxinyminutes.com/docs/lua/

      After understanding a bit more about Lua, you can use `:help lua-guide` as a
      reference for how Neovim integrates Lua.
      - :help lua-guide
      - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  Kickstart Guide:

    TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

      If you don't know what this means, type the following:
        - <escape key>
        - :
        - Tutor
        - <enter key>

      (If you already know the Neovim basics, you can skip this step.)

    Once you've completed that, you can continue working through **AND READING** the rest
    of the kickstart init.lua.

    Next, run AND READ `:help`.
      This will open up a help window with some basic information
      about reading, navigating and searching the builtin help documentation.

      This should be the first place you go to look when you're stuck or confused
      with something. It's one of my favorite Neovim features.

      MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
      which is very useful when you're not exactly sure of what you're looking for.

    I have left several `:help X` comments throughout the init.lua
      These are hints about where to find more information about the relevant settings,
      plugins or Neovim features used in Kickstart.

     NOTE: Look for lines like this

      Throughout the file. These are for you, the reader, to help you understand what is happening.
      Feel free to delete them once you know what you're doing, but they should serve as a guide
      for when you are first encountering a few different constructs in your Neovim config.

  If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

  I hope you enjoy your Neovim journey,
  - TJ

  P.S. You can delete this when you're done too. It's your config now! :)
  */
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # You can easily change to a different colorscheme.
    # Add your colorscheme here and enable it.
    #
    # If you want to see what colorschemes are already installed, you can use `:Telescope colorschme`.
    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
	  # Like many other themes, this one has different styles, and you could load
	  # any other, such as 'storm', 'moon', or 'day'.
          style = "night";
        };
      };
    };

    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      #TODO: Confirm this NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = false;
    };

    # [[ Setting options ]]
    # See `:help vim.opt`
    # NOTE: You can change these options as you wish!
    #  For more options, you can see `:help option-list`
    opts = {
      # Make line numbers default
      number = true;
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      #relativenumber = true

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the status line
      showmode = false;

      # Sync clipboard between OS and Neovim
      #  Remove this option if you want your OS clipboard to remain independent.
      #  See `:help 'clipboard'`
      clipboard = "unnamedplus";

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  See `:help 'listchars'`
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview subsitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # Set highlight on search, but clear on pressing <Esc> in normal mode
      hlsearch = true;
    };

    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmus/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }
      # TIP: Disable arrow keys in normal mode
      /*
      {
        mode = "n";
        key = "<left>";
        action = "<cmd>echo 'Use h to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<right>";
        action = "<cmd>echo 'Use l to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<up>";
        action = "<cmd>echo 'Use k to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<down>";
        action = "<cmd>echo 'Use j to move!!'<CR>";
      }
      */
      # Keybinds to make split navigation easier.
      #  Use CTRL+<hjkl> to switch between windows
      #
      #  See `:help wincmd` for a list of all window commands
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper window";
        };
      }
    ];
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };
    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.highlight.on_yank()`
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];
    plugins = {
      # [[ Install `lazy.nvim` plugin manager ]]
      #  See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
#      lazy = {
#        enable = true;
	# [[ Configure and install plugins ]]
	#
	#  To check the current status of your plugins, run
	#    :Lazy
	#
	#  You can press `?` in this menu for help. Use `:q` to close the window
	#
	#  To update plugins you can run
	#    :Lazy update
	#
	# NOTE: Here is where you install your plugins.
  # TODO: Probably remove LAZY
#        plugins = [
#        ];
#      };

      # NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
      sleuth = { # Detect tabstop and shiftwidth automatically
        enable = true;
      };

      # NOTE: Plugins can also be added by using a table,
      # with the first argument being the link and the following
      # keys can be used to configure plugin behavior/loading/etc.
      # 
      # Use `opts = {}` to force a plugin to be loaded.
      #
      #  This is equivalent to:
      #    require('Comment').setup({})
      #
      comment = { # "gc" to comment visual regions/lines
        enable = true;
      };


      # NOTE: Plugins can also be configured to run Lua code when they are loaded.
      #
      # This is often very useful to both group configuration, as well as handle
      # lazy loading plugins that don't need to be loaded immediately at startup.
      # 
      # For example, in the following configuration, we use:
      #  event = "VimEnter"
      #
      # which loads which-key before all the UI elements are loaded. Events can be
      # normal autocommands event (`:help autocmd-event`).
      #
      # Then because we use the `config` key, the configuration only runs
      # after the plugin has been loaded:
      #  config = function() ... end


      # NOTE: Plugins can specify dependencies.
      #
      # The dependencies are proper plugin specifications as well - anything
      # you do for a plugin at the top level, you can do for a dependency.
      #
      # Use the `dependencies` key to specify the dependencies of a particular plugin

      todo-comments = { # Highlight todo, notes, etc in comments
        enable = true;
        signs = true;
      };

    };

    extraPlugins = with pkgs.vimPlugins; [
      # Useful for getting pretty icons, but requires a Nerd Font.
      nvim-web-devicons # TODO: Figure out how to configure using this with telescope
    ];

    # TODO: Figure out where to move this
    extraConfigLuaPre = ''
      if vim.g.have_nerd_font then
        require('nvim-web-devicons').setup {}
      end
    '';

    # The line beneath this is called `modeline`. See `:help modeline`
    extraConfigLuaPost = ''
      -- vim: ts=2 sts=2 sw=2 et
    '';
  };
}
