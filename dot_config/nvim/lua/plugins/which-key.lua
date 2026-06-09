return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				{ "<leader>f", group = "File/Format" },
				{ "<leader>g", group = "Git" },
				{ "<leader>h", group = "Git Hunk" },
			})
		end,
	},
}
