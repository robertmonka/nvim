return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- local lazygit = require("lazygit")

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Run LazyGit" })
	end,
}
