-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "vn", "<esc>", { noremap = true, silent = true })
map("t", "vn", "<c-\\><c-n>", { noremap = false, silent = true })
map("i", "мт", "<esc>", { noremap = true, silent = true })
map("t", "мт", "<c-\\><c-n>", { noremap = false, silent = true })
map("n", "<leader>e", function()
  require("mini.files").open()
end, { noremap = false, silent = true })

local ls = require("luasnip")
map({ "i", "s" }, "<c-p>", function()
  ls.change_choice(1)
end, { silent = true })

map({ "i", "s" }, "<c-n>", function()
  ls.change_choice(-1)
end, { silent = true })
