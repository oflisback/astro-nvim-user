# Incomplete list of things to do after install

## Install language servers

Install with LspInstall, at least the following:

- lua_ls
- tsserver

## Install null-ls sources

Install with NullLsInstall

- prettierd
- eslint_d
- stylua
- black
- flake8

Install source servers such as prettierd I guess.

## Gotchas

### File management with oil.nvim

Oil is a slick plugin that creates a buffer based interface to the file system. Important keybinds:

- '-' to open current directory in a buffer, then edit it to make changes
- '\<CR\>' to go into a directory
- '-' to go to parent directory
