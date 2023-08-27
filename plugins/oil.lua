return {
  "stevearc/oil.nvim",
  config = function() require("oil").setup {} end,
  keys = {
    { "-", "<CMD>Oil<CR>" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
