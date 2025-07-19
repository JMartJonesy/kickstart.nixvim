{
  # Directory explorer
  plugins.yazi = {
    enable = true;
  };

  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extraconfigluapost
  extraConfigLuaPost = ''
      vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      callback = function()
        if vim.fn.isdirectory(vim.fn.expand("%")) == 1 then
          vim.cmd("Yazi")
        end
      end,
    })
  '';
}
