return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		telescope.setup({
			defaults = {
				path_display = { "smart" },

				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top, -- close buffer and move to the top
						},
						n = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top, -- close buffer and move to the top for normal
						},
					},
				},
				-- registers = {
				-- 	clear_register = function(prompt_bufnr)
				-- 		local selection = action_state.get_selected_entry()
				-- 		if selection then
				-- 			vim.fn.setreg(selection.value, "")
				-- 			actions.close(prompt_bufnr)
				-- 		end
				-- 	end,
				-- 	mappings = {
				-- 		i = {
				-- 			["<C-d>"] = actions.clear_register, -- close buffer and move to the top
				-- 		},
				-- 		n = {
				-- 			["<C-d>"] = actions.clear_register, -- close buffer and move to the top for normal
				-- 		},
				-- 	},
				-- },
			},
		})

		telescope.load_extension("fzf")
		-- telescope.load_extension("projects")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
		keymap.set("n", "<leader>fp", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
