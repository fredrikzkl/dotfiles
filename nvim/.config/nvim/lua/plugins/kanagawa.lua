if true then
  return {}
end

return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000, -- make sure it loads before UI plugins
  event = "VeryLazy",
  opts = {
    compile = false,
    undercurl = true,
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,

    -- Palette/theme tweaks
    colors = {
      theme = {
        wave = { ui = { bg = "#111111" } }, -- your bg
        all = { ui = { bg_gutter = "none" } },
      },
    },

    theme = "wave",
    background = {
      dark = "dragon", -- uncomment if you want :set background=dark to force dragon
      -- light = "lotus",
    },

    -- ✅ Put ALL your highlight changes here so they apply after the colorscheme.
    overrides = function(_)
      local c = {
        -- Core
        white = "#FFFFFF",
        black = "#000000",

        -- Grays / dark
        gray_dark = "#101010",
        gray_darker = "#131111",
        gray_light = "#888888",
        gray_medium = "#6272a4",

        -- Backgrounds
        bg_subtle = "#202030",
        bg_visual = "#525251",
        bg_visual_alt = "#353534",
        bg_search = "#595959",
        bg_selection = "#363646",
        bg_separator = "#1F3442",
        bg_cmp = "#111111",

        -- Conflicts
        bg_conflict_current = "#264033",
        bg_conflict_current_label = "#337367",
        bg_conflict_incoming = "#283B4D",
        bg_conflict_incoming_label = "#326290",
        bg_conflict_ancestor = "#545252",
        bg_conflict_ancestor_label = "#393939",

        -- Indent guides
        indent_scope = "#426787",
        indent_normal = "#152A36",

        -- Syntax
        blue = "#7E9CD8",
        blue_light = "#90CAE1",
        blue_bright = "#7EB4C9",
        cyan = "#53758D",
        green = "#688E81",
        green_alt = "#7AA89F",
        orange = "#FFA065",
        orange_bright = "#FF9D3C",
        orange_warning = "#e08300",
        pink = "#D27E9A",
        purple = "#947FB8",
        purple_alt = "#967FB8",
        purple_dark = "#938AA9",
        red = "#FF5D62",
        red_bright = "#ff0000",
        red_git = "#C34143",
        yellow = "#C0A36E",
        yellow_alt = "#938056",
        yellow_bright = "#F6C177",
        yellow_cursor = "#fcb205",

        -- Extras
        dracula_pink = "#ff79c6",
        dracula_orange = "#ffb86c",
        git_add = "#04b004",

        -- Markdown headings
        md_h1_bg = "#502824",
        md_h1_fg = "#fcd2b9",
        md_h2_bg = "#37352f",
        md_h2_fg = "#d2ccab",
        md_h3_bg = "#5a3d33",
        md_h3_fg = "#d1c4a5",
        md_h4_bg = "#223b40",
        md_h4_fg = "#bfd0d5",
        md_h5_bg = "#362930",
        md_h5_fg = "#dab9c6",
        md_h6_bg = "#22312d",
        md_h6_fg = "#bfd3ca",

        -- Cmp extras
        cmp_snippet = "#E46876",
        cmp_keyword_alt = "#D3859B",
      }

      return {
        -- UI
        WinSeparator = { fg = c.bg_separator, bg = "NONE", bold = true },
        NormalFloat = { bg = "NONE" },
        FloatBorder = { fg = c.gray_medium, bg = "NONE" },
        FloatTitle = { fg = c.dracula_orange, bg = "NONE" },
        CursorLineNr = { fg = c.yellow_cursor, bg = c.bg_subtle },
        Visual = { bg = c.bg_visual },
        VisualMatch = { bg = c.bg_visual_alt },
        Search = { bg = c.bg_search },
        CurSearch = { fg = c.black, bg = c.orange_bright },
        MatchParen = { fg = c.orange_bright, bg = c.bg_visual_alt, bold = true },

        -- Yanky
        YankyYanked = { fg = c.black, bg = c.yellow_bright, bold = true },
        YankyPut = { fg = c.black, bg = c.yellow_bright, bold = true },

        -- Snacks (picker)
        SnacksPickerListCursorLine = { bg = c.bg_subtle },
        SnacksPickerPrompt = { fg = c.dracula_pink },

        -- Noice cmdline
        NoiceCmdlineIcon = { fg = c.dracula_pink, bg = "NONE" },
        NoiceCmdlinePopupTitleCmdline = { fg = c.dracula_orange, bg = "NONE" },
        NoiceCmdlinePopupBorderCmdline = { fg = c.gray_medium, bg = "NONE" },

        -- GitSigns
        GitSignsAdd = { fg = c.git_add },
        GitSignsChange = { fg = c.orange_warning },
        GitSignsDelete = { fg = c.red_bright },
        GitSignsCurrentLineBlame = { fg = c.gray_light, italic = true },

        -- Neo-tree
        NeoTreeFloatBorder = { fg = c.gray_medium },
        NeoTreeFloatTitle = { fg = c.dracula_orange },
        NeoTreeCursorLine = { bg = c.bg_subtle },
        NeoTreeGitConflict = { bg = c.bg_conflict_incoming_label },

        -- Glance
        GlancePreviewNormal = { bg = c.gray_darker },
        GlanceListNormal = { bg = c.gray_dark },
        GlanceListEndOfBuffer = { bg = c.gray_dark },
        GlanceListBorderBottom = { bg = c.gray_dark, fg = c.bg_separator },
        GlanceBorderTop = { bg = c.gray_dark, fg = c.bg_separator },
        GlancePreviewBorderBottom = { bg = c.gray_dark, fg = c.bg_separator },

        -- Indent guides
        IblScope = { fg = c.indent_scope },
        IblIndent = { fg = c.indent_normal },

        -- Git conflicts
        GitConflictCurrentLabel = { bg = c.bg_conflict_current_label },
        GitConflictCurrent = { bg = c.bg_conflict_current },
        GitConflictIncomingLabel = { bg = c.bg_conflict_incoming_label },
        GitConflictIncoming = { bg = c.bg_conflict_incoming },
        GitConflictAncestorLabel = { bg = c.bg_conflict_ancestor_label },
        GitConflictAncestor = { bg = c.bg_conflict_ancestor },

        -- Blink Cmp (custom groups)
        BlinkCmpKind = { fg = c.blue_light },
        BlinkCmpKindVariable = { fg = c.blue_light },
        BlinkCmpKindMethod = { fg = c.orange },
        BlinkCmpKindFunction = { fg = c.orange },
        BlinkCmpKindConstructor = { fg = c.orange },
        BlinkCmpKindSnippet = { fg = c.cmp_snippet },
        BlinkCmpKindKeyword = { fg = c.cmp_keyword_alt },
        BlinkCmpKindField = { fg = c.blue },
        BlinkCmpKindProperty = { fg = c.blue },
        BlinkCmpKindEnumMember = { fg = c.pink },
        BlinkCmpKindEnum = { fg = c.pink },
        BlinkCmpKindFolder = { fg = c.purple_alt },
        BlinkCmpKindFile = { fg = c.purple_alt },
        BlinkCmpKindText = { fg = c.purple_alt },
        BlinkCmpKindClass = { fg = c.purple_dark },
        BlinkCmpKindReference = { fg = c.blue_light },
        BlinkCmpKindInterface = { fg = c.blue_light },
        BlinkCmpKindOperator = { fg = c.blue_light },
        BlinkCmpKindConstant = { fg = c.blue_light },
        BlinkCmpMenuDefault = { fg = c.blue_light },
        BlinkCmpKindDefault = { fg = c.blue_light },
        BlinkCmpKindStruct = { fg = c.blue_light },
        BlinkCmpKindModule = { fg = c.blue_light },
        BlinkCmpKindValue = { fg = c.blue_light },
        BlinkCmpKindEvent = { fg = c.blue_light },
        BlinkCmpKindColor = { fg = c.blue_light },
        BlinkCmpKindUnit = { fg = c.blue_light },

        -- Cmp window
        BlinkCmpMenu = { bg = c.bg_cmp },
        BlinkCmpMenuBorder = { bg = c.bg_cmp, fg = c.gray_medium },
        BlinkCmpMenuSelection = { bg = c.bg_selection },

        -- Markdown (RenderMarkdownH*Bg → regular highlights)
        RenderMarkdownH1Bg = { bg = c.md_h1_bg, fg = c.md_h1_fg },
        RenderMarkdownH2Bg = { bg = c.md_h2_bg, fg = c.md_h2_fg },
        RenderMarkdownH3Bg = { bg = c.md_h3_bg, fg = c.md_h3_fg },
        RenderMarkdownH4Bg = { bg = c.md_h4_bg, fg = c.md_h4_fg },
        RenderMarkdownH5Bg = { bg = c.md_h5_bg, fg = c.md_h5_fg },
        RenderMarkdownH6Bg = { bg = c.md_h6_bg, fg = c.md_h6_fg },
      }
    end,
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    -- vim.cmd.colorscheme("kanagawa-wave")
    -- your cursorline prefs
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "number"
    -- Optional: more explicit cursor
    vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "#FFFFFF" })
  end,
}
