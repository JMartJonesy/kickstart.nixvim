# This file is only used for standalone run/build of kickstart.nixvim
{
  imports = [ ../nixvim.nix ];
  # Optionally, add any extra settings here that you want to apply
  # only in the standalone version (not when imported as a module)
  # Example:
  # extraConfig = ''
  #   set number
  #   set relativenumber
  # '';
}
