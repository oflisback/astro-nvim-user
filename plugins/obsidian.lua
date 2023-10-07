vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })

local function get_hostname()
  local f = io.popen "/bin/hostname"
  if f ~= nil then
    local hostname = f:read "*a" or ""
    f:close()
    return string.gsub(hostname, "\n$", "")
  end
end

local dir = "~/repos/projs/private/obsidian-vault/ola"
if get_hostname() == "t490" then dir = "~/repos/projs/obsidian-vault/ola" end

return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup {
      disable_frontmatter = true,
      dir = dir,
      mappings = {},
    }
  end,
}
