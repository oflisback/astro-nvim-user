local with_root_file = function(...)
  local files = { ... }
  return function(utils) return utils.root_has_file(files) end
end

return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
                or utils.root_has_file ".eslintrc.cjs"
            end,
          })
        end,
      },
      onattach = function(client)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_augroup("format_on_save", { clear = true })
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            group = "format_on_save",
            pattern = "<buffer>",
            callback = function() vim.lsp.buf.formatting_sync { async = true } end,
          })
        end
      end,
      sources = {
        require("null-ls").builtins.diagnostics.selene.with {
          condition = with_root_file "selene.toml",
        },
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.prettierd,
        require("null-ls").builtins.formatting.stylua,
      },
    },
  },
}
