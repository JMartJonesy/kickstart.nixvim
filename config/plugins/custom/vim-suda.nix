{
  pugins.vim-suda = {
    enable = true;
  };

  extraConfigLuaPost = ''
    vim.g.suda_smart_edit = 1
  '';
}
