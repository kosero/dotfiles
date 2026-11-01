return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
}
