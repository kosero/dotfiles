return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",           desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",            desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",            desc = "Help Tags" },

      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",          desc = "Workspace Diagnostics" },
      { "<leader>fr", "<cmd>Telescope lsp_references<cr>",       desc = "LSP References" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
