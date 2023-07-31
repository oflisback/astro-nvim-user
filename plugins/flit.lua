return {
	"ggandor/flit.nvim",
	config = function()
		require("flit").setup({
			keys = { f = "f", F = "F", t = "t", T = "T" },
			labeled_modes = "nv",
			multiline = true,
			opts = {},
		})
	end,
	dependencies = { "ggandor/leap.nvim"},
	lazy = false
}
