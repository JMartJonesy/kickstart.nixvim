{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    plugins.which-key = { # Useful plugin to show you pending keybinds.
      enable = true;
      # Document existing key chains
      registrations = {
	#"<leader>c" = {
	#  name = "[C]ode";
	#  _ = "which_key_ignore";
	#};
	#"<leader>d" = {
	#  name = "[D]ocument";
	#  _ = "which_key_ignore";
	#};
	#"<leader>r" = {
	#  name = "[R]ename";
	#  _ = "which_key_ignore";
	#};
	#"<leader>s" = {
	# name = "[S]earch";
	# _ = "which_key_ignore";
	#};
	#"<leader>w" = {
	#  name = "[W]orkspace";
	#  _ = "which_key_ignore";
	#};
	#"<leader>t" = {
	#  name = "[T]oggle";
	#  _ = "which_key_ignore";
	#};
	"<leader>h" = {
	  name = "Git [H]unk";
	  _ = "which_key_ignore";
	};
      };
    };
  };
}
