return {
  "oflisback/obsidian-bridge.nvim",
  config = function()
    require("obsidian-bridge").setup {
      obsidian_server_address = "http://localhost:27125",
    }
  end,
  lazy = false,
}
