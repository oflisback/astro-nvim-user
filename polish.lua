require "user.autocmd"

-- For some reason this makes folding on obsidian TODO items work perfectly.
-- Not sure why, maybe overriding the default value is what does it.
local treesitter_parsers = require "nvim-treesitter.parsers"
if treesitter_parsers.has_parser "markdown" then
  local folds_query = [[
    [
      (paragraph)
    ] @fold
  ]]

  require("vim.treesitter.query").set("markdown", "folds", folds_query)
end
