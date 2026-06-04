return {
	enabled = false;
	lazy = false,
	"Timur-ux/xkbswitch.nvim",
	opts = {
		custom_layout_rules = {
			get_current_layout = function ()
				local id = vim.fn.system("niri msg keyboard-layouts | rg '\\*' | awk '{print $2}'")
				id = string.gsub(id, "\n", "", 1)
				return id
			end,
			set_layout = function (layout)
				if not layout then layout = "0" end
				vim.system({"niri", "msg", "action", "switch-layout", layout})
			end,
			user_us_layout_variation = "0"
		}
	}
}
