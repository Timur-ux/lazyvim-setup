local filetypes = { "quarto", "markdown", "jupyter", "json" }
return {
  {
    "benlubas/molten-nvim",
    version = "*", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
			vim.g.molten_tick_rate = 1000
			vim.g.molten_auto_image_popup = true
			vim.g.molten_auto_open_output = true
    end,
    ft = filetypes,
  },
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    version = "1.1.0",
    opts = {
      processor = "magick_cli",
      backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
      integrations = {}, -- do whatever you want with image.nvim's integrations
      max_width = 100, -- tweak to preference
      max_height = 12, -- ^
      max_height_window_percentage = math.huge, -- this is necessary for a good experience
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
    ft = filetypes,
  },
  {
    "quarto-dev/quarto-nvim",
    opts = {
      ft = filetypes,
      lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { "python" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        -- NOTE: setup your own keymaps:
        hover = "K",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
  },
  {
    "GCBallesteros/jupytext.nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = filetypes,
		lazy=false,
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    },
  },
}
