local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

--  Global --
keymap("n", "<leader>ee", ":Explore<CR>", opts)
keymap("n", "<leader>ww", ":w<CR>", opts)
keymap("n", "<leader>so", ":so%<CR>", opts)
keymap("n", "<leader>hh", ":noh<CR>", opts)
keymap("n", "<leader>aa", ":Alpha<CR>", opts)

--Null-ls
keymap("n", "<leader>ni", ":NullLsInfo<CR>", opts)

--Packer
keymap("n", "<leader>pi", ":PackerInstall<CR>", opts)
keymap("n", "<leader>ps", ":PackerSync<CR>", opts)
keymap("n", "<leader>pS", ":PackerStatus<CR>", opts)

--Gitsign
keymap("n", "<leader>gb", ":Gitsign blame_line<CR>", opts)
keymap("n", "<leader>gd", ":Gitsign diffthis<CR>", opts)

--telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)
vim.keymap.set("n", "<leader>fp", ":Telescope projects <CR>", opts)

--Lsp macon
keymap("n", "<leader>li", ":LspInfo<CR>", opts)
keymap("n", "<leader>lI", ":LspInstall<CR>", opts)
keymap("n", "<leader>la", ":LspStart<CR>", opts)
keymap("n", "<leader>ld", ":LspStop<CR>", opts)
keymap("n", "<leader>ma", ":Mason<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
