return {
  "ja-ford/delaytrain.nvim",
  config = function()
    require("delaytrain").setup {
      keys = {
        ["nv"] = { "h", "j", "k", "l", "w", "b" },
        ["nvi"] = { "<Left>", "<Down>", "<Up>", "<Right>" },
      },
      ignore_filetypes = { "org" },
    }
  end,
  lazy = false,
}
