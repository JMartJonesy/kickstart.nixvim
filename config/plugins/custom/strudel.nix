# TODO: Figure out how to do this the proper way without needing internet access for npm
{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "strudel.nvim";
      version = "unstable-2025-06-21";
      src = pkgs.fetchFromGitHub {
        owner = "gruvw";
        repo = "strudel.nvim";
        rev = "9ad3634c7c302f16db889a55c2ff13e66f56ded2";
        # Set this to all zeroes when you update rev and copy ssha256 in build error here
        sha256 = "SSD76hTVKZmCBT5sfji/fC8MExO2sZBumHM+rPIF4vQ=";
      };
      nativeBuildInputs = [ pkgs.nodejs ];
      buildPhase = ''
        cd js
        npm install --verbose
        npm run build
      '';
    })
  ];

  extraConfigLua = ''
    local strudel = require("strudel")
    strudel.setup({
      ui = {
        maximise_menu_panel = true,
        hide_menu_panel = false,
        hide_top_bar = false,
        hide_code_editor = false,
        hide_error_display = false,
      },
      update_on_save = false,
      sync_cursor = true,
      report_eval_errors = true,
      headless = false,
      browser_data_dir = vim.fn.expand("~/.cache/strudel-nvim/")
    })

    -- Recommended keymaps
    vim.keymap.set("n", "<leader>sl", strudel.launch, { desc = "Launch Strudel" })
    vim.keymap.set("n", "<leader>sq", strudel.quit, { desc = "Quit Strudel" })
    vim.keymap.set("n", "<leader>st", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
    vim.keymap.set("n", "<leader>su", strudel.update, { desc = "Strudel Update" })
    vim.keymap.set("n", "<leader>ss", strudel.stop, { desc = "Strudel Stop Playback" })
    vim.keymap.set("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
    vim.keymap.set("n", "<leader>sx", strudel.execute, { desc = "Strudel set current buffer and update" })
  '';
}
