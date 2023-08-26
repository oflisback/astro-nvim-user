local utils = require "astronvim.utils"
local get_icon = utils.get_icon

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- Disable toggleterm, they are moved to 'm' to free up 't' for trouble.
    ["<leader>tf"] = false,
    ["<leader>th"] = false,
    ["<leader>tl"] = false,
    ["<leader>tn"] = false,
    ["<leader>tp"] = false,
    ["<leader>tt"] = false,
    ["<leader>tu"] = false,
    ["<leader>tv"] = false,

    -- Terminals under misc
    ["<leader>mt"] = { name = get_icon("Terminal", 1, true) .. "Terminals" },
    ["<leader>mtn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" },
    ["<leader>mtp"] = { function() utils.toggle_term_cmd "python" end, desc = "ToggleTerm python" },

    -- second key is the lefthand side of the map
    ["<A-Right>"] = { ":bnext<CR>", desc = "Next buffer" },
    ["<A-Left>"] = { ":bprevious<CR>", desc = "Previous buffer" },
    ["<A-Down>"] = { ":bd<CR>", desc = "Delete buffer" },

    -- ChatGPT
    ["<leader>?"] = { "<cmd>ChatGPT<cr>", desc = "ChatGPT" },

    ["§"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

    -- m for Misc mappings
    ["<leader>mp"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown preview" },
    ["<leader>mg"] = { "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life" },
    ["<leader>mm"] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
    ["<leader>mk"] = { "<cmd>Telescope keymaps<cr>", desc = "Telescope keymaps" },
    ["<leader>mo"] = { "<cmd>BWipeout other<cr>", desc = "Only current" },

    -- Diagnostics
    ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev diagnostic" },

    -- Fundamentals
    ["<leader>w"] = { "<cmd>write<CR>", desc = "Write" },
    ["<leader>q"] = { "<cmd>quit<CR>", desc = "Quit" },

    ["<Tab>"] = { "<Plug>(leap-forward-to)" },
    ["<S-Tab>"] = { "<Plug>(leap-backward-to)" },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["§"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  },
}
