return {
	"rmagatti/auto-session",
	config = function()
		vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,localoptions"

		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			--      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
		-- 	pattern = "NvimTree*",
		-- 	callback = function()
		-- 		local view = require("nvim-tree.view")
		-- 		local is_visible = view.is_visible()
		--
		-- 		local api = require("nvim-tree.api")
		-- 		if not is_visible then
		-- 			api.trne.open()
		-- 		end
		-- 	end,
		-- })

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		keymap.set(
			"n",
			"<leader>ws",
			"<cmd>NvimTreeClose<CR><cmd>SessionSave<CR>",
			{ desc = "Save session for auto session root dir" }
		) -- save workspace session for current working directory
		keymap.set("n", "<leader>ww", "<cmd>SessionSearch<CR>", { desc = "Search session" })
	end,
}
