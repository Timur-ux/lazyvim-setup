-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "vn", "<esc>", {noremap = true, silent = true})
map("t", "vn", "<c-\\><c-n>", { noremap = false, silent = true })
map("i", "мт", "<esc>", {noremap = true, silent = true})
map("t", "мт", "<c-\\><c-n>", { noremap = false, silent = true })

local ls = require("luasnip")
map({ "i", "s" }, "<c-p>", function()
  ls.change_choice(1)
end, { silent = true })

map({ "i", "s" }, "<c-n>", function()
  ls.change_choice(-1)
end, { silent = true })

-- harpoon + bufferline pinned buffers match

local harpoon = require("harpoon")
local Path = require("plenary.path")
local function normalize_path(buf_name, root)
  return Path:new(buf_name):make_relative(root)
end

local SquashList = function(list)
  local len = list:length()
  local isSquashNeed = false
  for i = 1, len do
    if not list:get(i) then
      isSquashNeed = true
      break
    end
  end
	if not isSquashNeed then
		return
	end

  local items = {}
  for i = 1, len do
    local item = list:get(i)
    if item then
      table.insert(items, item)
    end
  end
  list:clear()
  for _, item in ipairs(items) do
    list:add(item)
  end
end

