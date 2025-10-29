return {
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			vim.g.tmux_navigator_preserve_zoom = 1
		end,
	},
	"nvim-lua/plenary.nvim",
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
}
