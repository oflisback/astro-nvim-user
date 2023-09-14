return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup {
      opts = {
        dir = "~/vault-mount",
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        --        ["gf"] = require("obsidian.mapping").gf_passthrough(),
      },
    }
  end,
}
