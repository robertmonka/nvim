local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "robert.plugins" },
	{ import = "robert.plugins.lsp" },
}, {
	install = {
		colorscheme = { "nightfox" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

-- Ubuntu pakuje treesitter w /usr/lib/.../nvim; lazy przebudowuje rtp i tę ścieżkę gubi
-- (bez niej :helptags / lazy docs → "No parser for language vimdoc").
local deb_parsers = "/usr/lib/x86_64-linux-gnu/nvim"
if vim.uv.fs_stat(deb_parsers) and not vim.o.rtp:find(deb_parsers, 1, true) then
	vim.opt.rtp:append(deb_parsers)
end
