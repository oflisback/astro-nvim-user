return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "🚦Trouble" },
    { "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "QuickFix" },
    { "<leader>tl", "<cmd>TroubleToggle loclist<cr>", desc = "LocationList" },
    { "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
    { "<leader>tf", "<cmd>TroubleToggle lsp_definitions<cr>", desc = "Definitions" },
  },
  cmd = "TroubleToggle",
}
