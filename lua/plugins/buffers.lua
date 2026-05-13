local cache = {}
local function normalize_path(buf_name, root)
  local path = cache[buf_name] or require("plenary.path"):new(buf_name)
  cache[buf_name] = path
  return path:make_relative(root)
end

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "ThePrimagen/harpoon" },
    opts = { },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
    keys = {
      {
        "<C-p>",
        function()
          require("harpoon"):list():prev()
        end,
        mode = { "n" },
      },
      {
        "<C-n>",
        function()
          require("harpoon"):list():next()
        end,
        mode = { "n" },
      },
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        mode = { "n" },
        desc = "Harpoon: add buffer to list",
      },
      {
        "<leader>hd",
        function()
          require("harpoon"):list():remove()
        end,
        mode = { "n" },
        desc = "Harpoon: delete buffer from list",
      },
    },
  },
  {
    "Timur-ux/harpoon-bufferline.nvim",
    dependencies = {
      "ThePrimeagen/harpoon",
      "akinsho/bufferline.nvim",
    },
    opts = {},
    lazy = false,
    keys = {
      {
        "<leader>hc",
        function()
          require("harpoon-bufferline").clearList()
        end,
        mode = { "n" },
        desc = "Harpoon: clear list",
      },
    },
  },
}
