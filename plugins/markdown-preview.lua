	-- You may need to manually do yarn install in:
	-- ~/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim/
	-- to get it working.
return {
		"iamcco/markdown-preview.nvim",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_browser = "firefox"
		end,
		build = "cd app && npm install",
		ft = { "markdown" },
	}
