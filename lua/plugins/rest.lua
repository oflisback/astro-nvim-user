local prefix = "<leader>m"

return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    -- ft = { "http", "httpresult" },
    ft = { "http" },
    dependencies = { "luarocks.nvim" },
    config = function() require("rest-nvim").setup() end,
    keys = {
      { prefix .. "r", "Rest run", desc = "RestNvim - Run request" },
    },
  },
}
