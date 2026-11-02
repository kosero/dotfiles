-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("gruvbox").setup({
--         terminal_colors = true,
--         undercurl = true,
--         underline = true,
--         bold = true,
--         italic = {
--           strings = false,
--           emphasis = true,
--           comments = true,
--           operators = false,
--           folds = true,
--         },
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true,
--         contrast = "medium",
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = false,
--       })
--
--       vim.cmd("colorscheme gruvbox")
--     end,
--   },
-- }

return {
  {
    dir = vim.fn.stdpath("config"),
    name = "bebis-theme",
    lazy = false,
    priority = 1000,
    config = function()
      local c = {
        bg      = "#c89664",
        fg      = "#321424",
        bg_dk   = "#b5834f",
        bg_hl   = "#d3a373",
        bg_sel  = "#e3c196",
        dim     = "#6b4a3a",
        red     = "#7f1d2d",
        orange  = "#6e3300",
        yellow  = "#5c4200",
        green   = "#2f4f1c",
        cyan    = "#14504f",
        blue    = "#1f3a6e",
        purple  = "#5a2468",
      }

      vim.cmd("highlight clear")
      if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
      end
      vim.o.termguicolors = true
      vim.o.background = "light"
      vim.g.colors_name = "bebis-themes"

      local hl = {
        -- Editör
        Normal         = { fg = c.fg, bg = c.bg },
        NormalNC       = { fg = c.fg, bg = c.bg },
        NormalFloat    = { fg = c.fg, bg = c.bg_dk },
        FloatBorder    = { fg = c.fg, bg = c.bg_dk },
        FloatTitle     = { fg = c.fg, bg = c.bg_dk, bold = true },
        CursorLine     = { bg = c.bg_hl },
        CursorColumn   = { bg = c.bg_hl },
        ColorColumn    = { bg = c.bg_hl },
        LineNr         = { fg = c.dim, bg = c.bg },
        CursorLineNr   = { fg = c.fg, bg = c.bg_hl, bold = true },
        SignColumn     = { fg = c.fg, bg = c.bg },
        FoldColumn     = { fg = c.dim, bg = c.bg },
        Folded         = { fg = c.dim, bg = c.bg_hl },
        VertSplit      = { fg = c.bg_dk, bg = c.bg },
        WinSeparator   = { fg = c.bg_dk, bg = c.bg },
        EndOfBuffer    = { fg = c.bg },
        NonText        = { fg = c.dim },
        Whitespace     = { fg = c.bg_dk },
        MatchParen     = { fg = c.fg, bg = c.bg_sel, bold = true },
        StatusLine     = { fg = c.bg, bg = c.fg },
        StatusLineNC   = { fg = c.fg, bg = c.bg_dk },
        Pmenu          = { fg = c.fg, bg = c.bg_dk },
        PmenuSel       = { fg = c.bg, bg = c.fg },
        PmenuSbar      = { bg = c.bg_dk },
        PmenuThumb     = { bg = c.fg },
        Visual         = { bg = c.bg_sel },
        Search         = { fg = c.fg, bg = c.bg_sel },
        IncSearch      = { fg = c.bg, bg = c.fg },
        Directory      = { fg = c.blue, bold = true },
        Title          = { fg = c.fg, bold = true },
        ErrorMsg       = { fg = c.red, bold = true },
        WarningMsg     = { fg = c.orange, bold = true },
        MoreMsg        = { fg = c.green },
        Question       = { fg = c.green },

        -- Syntax
        Comment        = { fg = c.dim, italic = true },
        Constant       = { fg = c.orange },
        String         = { fg = c.green },
        Character      = { fg = c.green },
        Number         = { fg = c.orange },
        Boolean        = { fg = c.orange, bold = true },
        Float          = { fg = c.orange },
        Identifier     = { fg = c.fg },
        Function       = { fg = c.blue },
        Statement      = { fg = c.purple, bold = true },
        Conditional    = { fg = c.purple, bold = true },
        Repeat         = { fg = c.purple, bold = true },
        Label          = { fg = c.purple },
        Operator       = { fg = c.cyan },
        Keyword        = { fg = c.purple, bold = true },
        Exception      = { fg = c.red },
        PreProc        = { fg = c.red },
        Include        = { fg = c.red },
        Define         = { fg = c.red },
        Macro          = { fg = c.red },
        PreCondit      = { fg = c.red },
        Type           = { fg = c.yellow, bold = true },
        StorageClass   = { fg = c.yellow },
        Structure      = { fg = c.yellow },
        Typedef        = { fg = c.yellow },
        Special        = { fg = c.cyan },
        SpecialChar    = { fg = c.cyan },
        Tag            = { fg = c.blue },
        Delimiter      = { fg = c.dim },
        SpecialComment = { fg = c.dim, bold = true },
        Debug          = { fg = c.red },
        Underlined     = { fg = c.blue, underline = true },
        Ignore         = { fg = c.dim },
        Error          = { fg = c.red, bold = true },
        Todo           = { fg = c.bg, bg = c.fg, bold = true },

        -- Tree-sitter
        ["@variable"]           = { fg = c.fg },
        ["@variable.builtin"]   = { fg = c.red },
        ["@variable.parameter"] = { fg = c.fg, italic = true },
        ["@variable.member"]    = { fg = c.cyan },
        ["@constant"]           = { fg = c.orange },
        ["@constant.builtin"]   = { fg = c.orange, bold = true },
        ["@keyword"]            = { fg = c.purple, bold = true },
        ["@function"]           = { fg = c.blue },
        ["@function.builtin"]   = { fg = c.blue, bold = true },
        ["@function.call"]      = { fg = c.blue },
        ["@string"]             = { fg = c.green },
        ["@type"]               = { fg = c.yellow, bold = true },
        ["@type.builtin"]       = { fg = c.yellow },
        ["@property"]           = { fg = c.cyan },
        ["@punctuation"]        = { fg = c.dim },
        ["@operator"]           = { fg = c.cyan },
        ["@comment"]            = { fg = c.dim, italic = true },
        ["@module"]             = { fg = c.red },
        ["@tag"]                = { fg = c.blue },
        ["@tag.attribute"]      = { fg = c.cyan },

        -- Diagnostik
        DiagnosticError          = { fg = c.red },
        DiagnosticWarn           = { fg = c.orange },
        DiagnosticInfo           = { fg = c.blue },
        DiagnosticHint           = { fg = c.cyan },
        DiagnosticUnderlineError = { sp = c.red, undercurl = true },
        DiagnosticUnderlineWarn  = { sp = c.orange, undercurl = true },
        DiagnosticUnderlineInfo  = { sp = c.blue, undercurl = true },
        DiagnosticUnderlineHint  = { sp = c.cyan, undercurl = true },

        -- Diff, GitSigns
        DiffAdd        = { bg = "#b9b273" },
        DiffChange     = { bg = "#c9a46b" },
        DiffDelete     = { fg = c.red, bg = "#c98a6b" },
        DiffText       = { bg = c.bg_sel, bold = true },
        GitSignsAdd    = { fg = c.green, bg = c.bg },
        GitSignsChange = { fg = c.yellow, bg = c.bg },
        GitSignsDelete = { fg = c.red, bg = c.bg },

        -- Telescope
        TelescopeNormal         = { fg = c.fg, bg = c.bg },
        TelescopeBorder         = { fg = c.dim, bg = c.bg },
        TelescopeSelection      = { fg = c.fg, bg = c.bg_sel, bold = true },
        TelescopeMatching       = { fg = c.red, bold = true },
        TelescopePromptPrefix   = { fg = c.purple },
      }

      local set_hl = vim.api.nvim_set_hl
      for group, settings in pairs(hl) do
        set_hl(0, group, settings)
      end
    end,
  },
}
