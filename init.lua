-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- load snippets
-- use function in order to add capability to update snippets without reenter neovim
function LoadSnippets()
  vim.cmd("runtime! lua/snippets/*.lua")
end

LoadSnippets()

require("config.commands")
