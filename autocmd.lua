vim.cmd [[
  augroup _general_settings
    autocmd!
      autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _fugitive
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
  augroup end

  augroup _save_on_leave_insert
    autocmd!
    autocmd FileType markdown autocmd InsertLeave <buffer> :if line('$') > 0 || getline(1) != '' | write | endif
  augroup end

  augroup markdownCmdHeight
    autocmd!
    autocmd FileType markdown set cmdheight=2
  augroup END
  augroup otherFilesCmdHeight
    autocmd!
    autocmd FileType * set cmdheight=1
  augroup END
]]

-- Trim trailing whitespace on save for org files
local function trim_trailing_whitespace()
  local save = vim.fn.winsaveview()
  vim.cmd [[keeppatterns %s/\s\+$//e]]
  vim.fn.winrestview(save)
end
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.org",
  callback = trim_trailing_whitespace,
})

-- In org mode format current line on save, this
-- formats current table.
local function format_current_line() vim.cmd "normal! gqgq" end
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.org",
  callback = format_current_line,
})

-- Add timestamp as extension for backup files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true }),
  desc = "Add timestamp to backup extension",
  pattern = "*",
  callback = function() vim.opt.backupext = "-" .. vim.fn.strftime "%Y%m%d%H%M" end,
})
