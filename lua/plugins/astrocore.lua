-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<C-d>"] = "15jzz",
        ["<C-u>"] = "15kzz",
        ["<C-f>"] = "30jzz",
        ["<C-b>"] = "30kzz",
        -- Disable toggleterm, they are moved to 'm' to free up 't' for trouble.
        ["<Leader>tf"] = false,
        ["<Leader>th"] = false,
        ["<Leader>tl"] = false,
        ["<Leader>tn"] = false,
        ["<Leader>tp"] = false,
        ["<Leader>tt"] = false,
        ["<Leader>tu"] = false,
        ["<Leader>tv"] = false,

        ["<Tab>"] = "<cmd>:bnext<CR>",
        ["<S-Tab>"] = "<cmd>:bprev<CR>",

        -- Show lsp signature info for current function
        ["<Leader>lp"] = {
          "<cmd>lua vim.lsp.buf.hover()<cr>",
        },

        -- Diffview!
        ["<Leader>gd"] = {
          function()
            if next(require("diffview.lib").views) == nil then
              vim.cmd "DiffviewOpen"
            else
              vim.cmd "DiffviewClose"
            end
          end,
          desc = "Diffview",
        },

        ["<Leader>gn"] = "<cmd>:Neogit<CR>",

        ["<Leader>z"] = {
          function() require("telescope").extensions.zoxide.list {} end,
          desc = "Zoxide",
        },

        ["<Leader>gwc"] = {
          function() require("telescope").extensions.git_worktree.create_git_worktree() end,
          desc = "Create git worktree",
        },
        ["<Leader>gwd"] = {
          function() require("telescope").extensions.git_worktree.delete_git_worktree() end,
          desc = "Delete git worktree",
        },
        ["<Leader>gwl"] = {
          function() require("telescope").extensions.git_worktree.git_worktrees() end,
          desc = "Git worktrees",
        },

        -- Clear astronvim mapping for better j/k with wrapped lines. They break j/k for delaytrain.nvim
        ["j"] = false,
        ["k"] = false,

        -- Org mode
        ["<Leader>ot"] = { function() user_utils.apply_todo_transformation() end, desc = "Apply todo transformation" },

        -- Obsidian
        ["<Leader>o"] = { desc = "󰈙 Obsidian" },
        ["<Leader>oq"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: Quick search" },
        ["<Leader>of"] = { "<cmd>ObsidianSearch<cr>", desc = "Obsidian: Search" },
        ["<Leader>ob"] = { "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian: Back links" },
        ["<Leader>od"] = { "<cmd>ObsidianBridgeDailyNote<CR>", desc = "Create or open daily note" },
        ["<Leader>og"] = { "<cmd>ObsidianBridgeOpenGraph<CR>", desc = "Open graph view" },
        -- Does not work well at least not with my links.
        --    ["<Leader>oo"] = { "<cmd>ObsidianFollowLink<cr>", desc = "Obsidian: Follow link" },
        ["<Leader>op"] = { "<cmd>ObsidianTemplate<cr>", desc = "Obsidian: Paste Template" },

        -- Terminals under misc
        ["<Leader>mt"] = { name = require("astroui").get_icon("Terminal", 1, true) .. "Terminals" },
        ["<Leader>mtn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" },
        ["<Leader>mtp"] = { function() utils.toggle_term_cmd "python" end, desc = "ToggleTerm python" },

        -- ChatGPT
        ["<Leader>?"] = { "<cmd>ChatGPT<cr>", desc = "ChatGPT" },

        ["§"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

        -- m for Misc mappings
        ["<Leader>mp"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown preview" },
        ["<Leader>mg"] = { "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life" },
        ["<Leader>mm"] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain" },
        ["<Leader>mk"] = { "<cmd>Telescope keymaps<cr>", desc = "Telescope keymaps" },
        ["<Leader>mo"] = { "<cmd>BWipeout other<cr>", desc = "Only current" },
        ["<Leader>mf"] = { ":exe ':silent !Firefox %'<cr>", desc = "Open in Firefox" },

        -- Diagnostics
        ["<Leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
        ["<Leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev diagnostic" },

        -- Fundamentals
        ["<Leader>w"] = { "<cmd>write<CR>", desc = "Write" },
        ["<Leader>q"] = { "<cmd>quit<CR>", desc = "Quit" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["§"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      },
    },
  },
}
