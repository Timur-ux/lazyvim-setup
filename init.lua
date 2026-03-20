-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- load snippets
if not vim.g.vscode then
  for _, path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
    loadfile(path)()
  end
end
