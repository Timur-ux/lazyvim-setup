-- there placed custom commands i use

vim.api.nvim_create_user_command("LusSnipReload", function()
  require("luasnip").cleanup()
  LoadSnippets()
  vim.notify("Snippets Reloaded", vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("ClearRegs", function()
  local regs = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"='
  for i = 1, #regs do
    local char = regs:sub(i, i)
    vim.fn.setreg(char, {})
  end
end, {})
