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
      providers = {
        snippets = {
					min_keyword_length=2,
          score_offset = 50,
        },
        lsp = {
          score_offset = 50,
        },
        path = {
          score_offset = 25,
        },
        buffer = {
					min_keyword_length=3,
          score_offset = 10,
        },
      },
    },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-h>"] = { "select_next", "fallback" },
      ["<C-l>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "snippet_forward", "fallback" },
      ["<C-k>"] = { "snippet_backward", "fallback" },
    },
    snippets = {
      preset = "luasnip",
    },
  },
}
