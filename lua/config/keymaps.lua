-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local removeMap = vim.keymap.del

map("i", "jk", "<esc>", { noremap = true, silent = true })
map("t", "jk", "<c-\\><c-n>", { noremap = false, silent = true })

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

local BufferAdd = function(list, bufname)
  list:add()
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

local BufferDelete = function(list, idx)
  list:remove(list:get(idx))
  SquashList(list)
end

local BufferToggle = function()
  vim.api.nvim_command("BufferLineTogglePin")
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = normalize_path(vim.api.nvim_buf_get_name(bufnr), vim.fn.getcwd())

  local list = harpoon:list()
  local len = list:length()
  for i = 1, len do
    local item = list:get(i)
    if item and item.value == bufname then
      BufferDelete(list, i)
      return
    end
  end
  BufferAdd(list)
end

map("n", "<leader>bp", BufferToggle, { desc="Toggle pin and harpoon", noremap = false , silent = true})
