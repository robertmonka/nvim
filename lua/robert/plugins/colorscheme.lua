return {
	{
		"EdenEast/nightfox.nvim",
		--       version = "main", -- Use for stability; omit to use `main` branch for the latest features
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme nightfox]])
		end,
	},
}
