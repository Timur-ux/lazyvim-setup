-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<esc>", { noremap = true, silent = true })
map("t", "jk", "<c-\\><c-n>", { noremap = false, silent = true })

local ls = require("luasnip")
map({ "i", "s" }, "<c-j>", function()
  ls.jump(1)
end, { silent = true })

map({ "i", "s" }, "<c-k>", function()
  ls.jump(-1)
end, { silent = true })

map({ "i", "s" }, "<c-e>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- map({ "i" }, "<tab>")
