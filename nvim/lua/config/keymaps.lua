-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- vim.keymap.set("n", "<leader>f", function()
--   require("conform").format({ bufnr = 0 })
-- end)

-- Format avec LSP ou Conform
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })
