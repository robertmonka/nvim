return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		--    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		--    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = false,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				--        icons = {
				--          glyphs = {
				--            folder = {
				--              arrow_closed = "´üí", -- arrow when folder is closed
				--              arrow_open = "´üú", -- arrow when folder is open
				--            },
				--          },
				--        },
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = true,
			},
			filesystem_watchers = {
				max_events = 200,
				ignore_dirs = function(path)
					local normalized = path:gsub("\\", "/")
					-- Any path inside .git/ (e.g. objects/). NVim-tree's built-in is_git() only skips the .git node itself.
					if normalized:find("/.git/", 1, true) ~= nil then
						return true
					end
					return normalized:find("/.claude/skills", 1, true) ~= nil
						or normalized:find("/.codex", 1, true) ~= nil
				end,
			},
			-- enable following the current file
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
