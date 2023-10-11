return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  lazy = true,
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
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<A-space>",
          node_incremental = "<A-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
}
