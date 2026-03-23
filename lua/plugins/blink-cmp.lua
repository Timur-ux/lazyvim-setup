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
          min_keyword_length = 0,
          score_offset = 4,
        },
        lsp = {
          min_keyword_length = 0,
          score_offset = 3,
        },
        path = {
          min_keyword_length = 0,
          score_offset = 2,
        },
        buffer = {
          min_keyword_length = 5,
          score_offset = 1,
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
