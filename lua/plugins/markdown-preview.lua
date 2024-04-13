-- You may need to manually do yarn install in:
-- ~/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim/
-- to get it working.
return {
  "iamcco/markdown-preview.nvim",
  init = function()
    vim.cmd [[
   function OpenMarkdownPreview (url)
              execute "silent ! open -a Firefox -n --args --new-window " . a:url
            endfunction
            let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    ]]
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  build = "cd app && npm install",
  ft = { "markdown" },
}
