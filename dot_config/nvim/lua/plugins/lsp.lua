return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "mesonlsp", "clangd", "rust_analyzer", "lua_ls", "pyright", "gopls" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local custom_on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end

      local function setup_server(name, opts)
        opts = opts or {}
        opts.capabilities = capabilities
        local user_on_attach = opts.on_attach
        opts.on_attach = function(client, bufnr)
          custom_on_attach(client, bufnr)
          if user_on_attach then
            user_on_attach(client, bufnr)
          end
        end

        if vim.lsp.config then
          vim.lsp.config(name, opts)
        else
          local status, lspconfig = pcall(require, "lspconfig")
          if status then
            lspconfig[name].setup(opts)
          end
        end
      end

      setup_server("mesonlsp")
      setup_server("clangd")
      setup_server("rust_analyzer")
      setup_server("lua_ls")
      setup_server("pyright")
      setup_server("gopls")

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        float = {
          border = "rounded",
          source = "always",
          focusable = false,
        },
      })

      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Hata detayını popup göster" })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })

      vim.o.updatetime = 300
    end,
  },
}
