return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup {
      view_options = {
        show_hidden = true,
      },
    }
  end,
  keys = {
    { "-", "<CMD>Oil<CR>" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
