return {
	"hoscarcito/cursor-nvim-plugin",
	lazy = false, -- Load immediately to register VimScript commands
	config = function()
		-- Plugin commands are available after loading:
		-- :CursorChat, :CursorEdit, :CursorGenerate, etc.

		-- Set up keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>cc", ":CursorChat<CR>", { desc = "Cursor: Chat" })
		keymap.set("n", "<leader>ce", ":CursorEdit<CR>", { desc = "Cursor: Edit" })
		keymap.set("v", "<leader>ce", ":CursorEdit<CR>", { desc = "Cursor: Edit selection" })
		keymap.set("n", "<leader>cg", ":CursorGenerate<CR>", { desc = "Cursor: Generate code" })
		keymap.set("v", "<leader>cx", ":CursorExplain<CR>", { desc = "Cursor: Explain code" })
		keymap.set("n", "<leader>cr", ":CursorReview<CR>", { desc = "Cursor: Review file" })
		keymap.set("v", "<leader>co", ":CursorOptimize<CR>", { desc = "Cursor: Optimize code" })
		keymap.set("v", "<leader>cf", ":CursorFix<CR>", { desc = "Cursor: Fix errors" })
		keymap.set("v", "<leader>crf", ":CursorRefactor<CR>", { desc = "Cursor: Refactor" })
	end,
}
