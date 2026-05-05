return {
  {
    "neovim/nvim-lspconfig",
		lazy=false,
    opts = {
      diagnostics = { virtual_text = false },
      inlay_hints = { enabled = false },
      autoformat = { enabled = false },
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportUnusedExpression = "none",
                },
              },
            },
         },
        },
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
