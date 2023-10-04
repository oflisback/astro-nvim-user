return {
  "oflisback/obsidian-bridge.nvim",
  config = function()
    require("obsidian-bridge").setup {
      obsidian_server_address = "http://localhost:27123",
    }
  end,
  lazy = false,
}
