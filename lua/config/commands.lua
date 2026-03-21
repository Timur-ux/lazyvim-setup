-- there placed custom commands i use

vim.api.nvim_create_user_command("LusSnipReload", function()
  LoadSnippets()
  vim.notify("Snippets Reloaded", vim.log.levels.INFO)
end, {})
