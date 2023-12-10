return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "NvimTree",
					text = "NvimTree",
					highlight = "Directory",
					speparator = "True",
				},
			},
		},
	},
}
