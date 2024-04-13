return {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true },
  },
  lazy = false,
  config = function()
    -- Setup treesitter
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
      },
      ensure_installed = { "org" },
    }

    -- Setup orgmode
    require("orgmode").setup {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
      org_startup_indented = false,
      org_log_done = false,
      mappings = {
        org = {
          org_set_tags_command = "<leader>oT",
        },
      },
    }
  end,
}
