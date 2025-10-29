-- Test comment: Avante.nvim plugin configuration for AI-powered coding assistance
return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = "make",
	opts = {
		provider = "claude",
		-- Mode: "agentic" uses tools to automatically generate code, "legacy" uses old planning method
		mode = "agentic",
		auto_suggestions_provider = "claude",

		-- Project-specific instruction file
		instructions_file = "avante.md",

		-- Workaround for window ID validation issues
		debug = false,

		-- Provider settings
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				timeout = 30000,
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 20480,
				},
			},
		},
		windows = {
			sidebar_header = {
				enabled = false,
			},
			fillchars = "eob: ",
			position = "right",
			wrap = true,
			width = 40,
			sidebar = {
				size = 40,
			},
			ask = {
				floating = false,
				border = "rounded",
				start_insert = true,
			},
			edit = {
				border = "rounded",
				start_insert = true,
			},
		},
		highlights = {
			diff = {
				current = "DiffChange",
				incoming = "DiffAdd",
			},
		},
		behaviour = {
			auto_suggestions = false,
			auto_apply_diff_after_generation = true,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			support_paste_from_clipboard = true,
		},
		hints = {
			enabled = false,
		},
		mappings = {
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]x",
				prev = "[x",
			},
			suggestion = {
				accept = "<M-l>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			sidebar = {
				apply_all = "A",
				apply_cursor = "a",
				switch_windows = "<Tab>",
				reverse_switch_windows = "<S-Tab>",
			},
		},
		selector = {
			exclude_auto_select = { "NvimTree" },
		},
	},

	-- Dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},

		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
