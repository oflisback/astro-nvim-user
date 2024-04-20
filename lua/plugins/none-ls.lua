-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    config.onattach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_augroup("format_on_save", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          group = "format_on_save",
          pattern = "<buffer>",
          callback = function() vim.lsp.buf.formatting_sync { async = true } end,
        })
      end
    end
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
    }
    return config -- return final config table
  end,
}
