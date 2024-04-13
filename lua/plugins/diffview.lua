return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "DiffviewOpen",
  opts = {
    enhanced_diff_hl = false,
    file_panel = {
      listing_style = "list",
    },
  },
}
