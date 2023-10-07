return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "cmake",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "tsx",
        "typescript",
      },
      -- markdown addition for obsidian.nvim
      highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
      indent = { enable = true },
      -- For vim-matchup
      matchup = { enable = true },
    }
  end,
}
