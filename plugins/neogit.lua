return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim",
  },
  config = true,
  lazy = false,
}
