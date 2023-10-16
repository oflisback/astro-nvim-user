return {
  "nvim-telescope/telescope.nvim",
  -- install fzf native
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function() require("telescope").load_extension "fzf" end,
    },
    {
      "jvgrootveld/telescope-zoxide",
      config = function() require("telescope").load_extension "zoxide" end,
    },
    -- For trouble.providers.telescope
    "folke/trouble.nvim",
  },
  keys = {
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files { cwd = require("lazy.core.config").options.root } end,
      desc = "Find Plugin File",
    },
    -- This is using b because it used to be fzf's :Buffers
    {
      "<leader>r",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent",
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local trouble = require "trouble.providers.telescope"

    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        mappings = {
          i = {
            ["<Left>"] = false,
            ["<Right>"] = false,
            ["<Down>"] = false,
            ["<Up>"] = false,
          },
          n = {
            ["<Left>"] = false,
            ["<Right>"] = false,
            ["<Down>"] = false,
            ["<Up>"] = false,
          },
        },
        winblend = vim.g.neovide and vim.g.winblend + 10 or vim.g.winblend,
        selection_caret = "  ",
        layout_config = {
          width = 0.90,
          height = 0.85,
          preview_cutoff = 120,
          horizontal = {
            preview_width = 0.6,
          },
          vertical = {
            width = 0.9,
            height = 0.95,
            preview_height = 0.5,
          },
          flex = {
            horizontal = {
              preview_width = 0.9,
            },
          },
        },
      },
      pickers = {
        live_grep = {
          mappings = {
            i = { ["<c-f>"] = actions.to_fuzzy_refine, ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      },
    })
  end,
}
