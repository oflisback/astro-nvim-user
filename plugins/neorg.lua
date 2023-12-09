return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  run = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              ola = "~/repos/neorg/ola",
              york = "~/repos/neorg/york",
            },
            default_workspace = "ola",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
  ft = "norg",
}
