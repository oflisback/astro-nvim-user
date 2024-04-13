return {
  dir = "~/repos/projs/private/obsidian-bridge.nvim",
  config = function()
    require("obsidian-bridge").setup {
      obsidian_server_address = "http://localhost:27123",
      scroll_sync = true,
    }
  end,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  lazy = true,
}
