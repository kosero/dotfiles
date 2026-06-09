return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {  "commonlisp", "meson", "lua", "vim", "vimdoc", "c", "cpp", "rust", "python", "haskell" },
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			local status, ts_configs = pcall(require, "nvim-treesitter.configs")
			if status then
				ts_configs.setup(opts)
			end
		end,
	},
}
