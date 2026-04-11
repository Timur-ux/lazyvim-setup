-- there placed custom commands i use

vim.api.nvim_create_user_command("LusSnipReload", function()
	require("luasnip").cleanup()
  LoadSnippets()
  vim.notify("Snippets Reloaded", vim.log.levels.INFO)
end, {})
