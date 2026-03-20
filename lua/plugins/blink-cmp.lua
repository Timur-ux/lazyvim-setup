return {
  "saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  opts = {
    sources = {
      default = {
        "snippets",
        "lsp",
        "path",
        "buffer",
      },
    },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "accept", "fallback" },
    },
    snippets = {
      preset = "luasnip",
    },
  },
}
