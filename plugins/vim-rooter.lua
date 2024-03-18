return {
  "airblade/vim-rooter",
  lazy = false,
  init = function()
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_patterns = { ".git" }
  end,
}
