-- Set leader key to space

vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps -------------------

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize up" })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize down" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize right" })

-- Tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Go to previus buffer" })

-- Move text up and down
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

-- Clppboard
-- vim.keymap.set("n", "y", 'y"+y', { noremap = true })
-- vim.keymap.set("n", "Y", 'Y"+Y', { noremap = true })
-- vim.keymap.set("v", "y", 'y"+y', { noremap = true })
keymap.set("v", "<leader>c", '"+y', { desc = "Copy to clipboard" })
