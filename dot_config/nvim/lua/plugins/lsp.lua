return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })

      vim.filetype.add({
        extension = {
          vert = "glsl",
          frag = "glsl",
          geom = "glsl",
          comp = "glsl",
          tesc = "glsl",
          tese = "glsl",
          glsl = "glsl",
          hlsl = "hlsl",
          fx   = "hlsl",
          wren = "wren",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "mesonlsp",
          "clangd",
          "rust_analyzer",
          "lua_ls",
          "pyright",
          "gopls",
          "glsl_analyzer",
        },
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
          vim.lsp.enable(name)
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
      setup_server("glsl_analyzer")

      local lspconfig = require("lspconfig")

      setup_server("wren_lsp", {
        cmd = { "wren-lsp" },
        filetypes = { "wren" },
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root = lspconfig.util.root_pattern("wren-lsp.json", ".git", "wren.mod")(fname)
          on_dir(root or vim.fs.dirname(fname))
        end,
        single_file_support = true,
      })

      setup_server("gdscript", {
        cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        filetypes = { "gd", "gdscript", "gdscript3" },
        root_markers = { "project.godot", ".git" },
      })

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
