return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local c = {
				bg     = "#c89664",
				fg     = "#321424",
				bg_dk  = "#b5834f",
				bg_sel = "#e3c196",
				dim    = "#6b4a3a",
				red    = "#7f1d2d",
				orange = "#6e3300",
				green  = "#2f4f1c",
				blue   = "#1f3a6e",
				purple = "#5a2468",
			}

			local function mode(accent)
				return {
					a = { fg = c.bg, bg = accent, gui = "bold" },
					b = { fg = c.fg, bg = c.bg_sel },
					c = { fg = c.fg, bg = c.bg_dk },
				}
			end

			local theme = {
				normal   = mode(c.blue),
				insert   = mode(c.green),
				visual   = mode(c.purple),
				replace  = mode(c.red),
				command  = mode(c.orange),
				terminal = mode(c.green),
				inactive = {
					a = { fg = c.dim, bg = c.bg_dk },
					b = { fg = c.dim, bg = c.bg_dk },
					c = { fg = c.dim, bg = c.bg_dk },
				},
			}

			require("lualine").setup({
				options = {
					theme = theme,
					section_separators = "",
					component_separators = "|",
				},
			})
		end,
	},
}
