local harpoon = function()
	return require("harpoon")
end
return {
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
          harpoon():list():prev()
        end,
        mode = {"n"},
      },
      {
        "<C-n>",
        function()
          harpoon():list():next()
        end,
        mode = {"n"},
      },
    },
  },
}
