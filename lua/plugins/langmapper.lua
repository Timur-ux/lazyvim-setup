return {
  {
    "Wansmer/langmapper.nvim",
    lazy = false,
    priority = 1, -- High priority is needed if you will use `autoremap()`
    opts = {
      os = {
        layouts = {
          ru = {
            id = "ru",
          },
        },
        Linux = {
          get_current_layout_id = function()
            local cmd = "niri msg keyboard-layouts | grep '*' | awk '{print $3}'"
            if vim.fn.executable(cmd) then
              local output = vim.split(vim.trim(vim.fn.system(cmd)), "\n")
              local layout = output[#output]
              if layout == "Russian" then
                return "ru"
              end
              return "us"
            end
          end,
        },
      },
    },
  },
}
