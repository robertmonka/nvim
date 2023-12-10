return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						newfile_status = false,
						path = 0, --3 to full path

						shorting_target = 40,

						symbols = {
							modified = "[+]",
							readonly = "[-]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
			},
		})
	end,
}
