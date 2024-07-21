{
  programs.nixvim = {
    # Useful plugin to show you pending keybinds.
    # https://nix-community.github.io/nixvim/plugins/which-key/index.html
    plugins.which-key = {
      enable = true;

      # Document existing key chains
      registrations = {
        "<leader>c" = {
          name = "[C]ode";
          _ = "which_key_ignore";
        };
        "<leader>d" = {
          name = "[D]ocument";
          _ = "which_key_ignore";
        };
        "<leader>r" = {
          name = "[R]ename";
          _ = "which_key_ignore";
        };
        "<leader>s" = {
          name = "[S]earch";
          _ = "which_key_ignore";
        };
        "<leader>w" = {
          name = "[W]orkspace";
          _ = "which_key_ignore";
        };
        "<leader>t" = {
          name = "[T]oggle";
          _ = "which_key_ignore";
        };
        "<leader>h" = {
          name = "Git [H]unk";
          _ = "which_key_ignore";
        };
      };
    };
  };
}
