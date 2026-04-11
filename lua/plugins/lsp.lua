return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = false },
      inlay_hints = { enabled = false },
      autoformat = { enabled = false },
      servers = {
        pyright = {},
        clangd = {},
        texlab = {},
        nil_ls = {},
        omnisharp = {
          settings = {
            FormattingOptions = {
              newLine = "\n",
              useTabs = true,
              tabSize = 2,
              indentationSize = 2,
            },
          },
        },
      },
    },
  },
}
