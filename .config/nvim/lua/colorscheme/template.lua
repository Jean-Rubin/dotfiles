-- Clone of base16-colorscheme script: https://github.com/RRethy/nvim-base16/blob/master/lua/base16-colorscheme.lua
-- Some useful links for making your own colorscheme:
-- https://github.com/chriskempson/base16
-- https://colourco.de/
-- https://color.adobe.com/create/color-wheel
-- http://vrl.cs.brown.edu/color

local M = {}

-- This is a bit of syntactic sugar for creating highlight groups.
--
-- local colorscheme = require('colorscheme')
-- local hi = colorscheme.highlight
-- hi.Comment = { fg='#ffffff', bg='#000000', attr='italic', sp=nil }
-- hi.LspDiagnosticsDefaultError = 'DiagnosticError' -- Link to another group
--
-- This is equivalent to the following vimscript
--
-- hi Comment fg=#ffffff bg=#000000 attr=italic
-- hi! link LspDiagnosticsDefaultError DiagnosticError
M.highlight = setmetatable({}, {
    __newindex = function(_, hlgroup, args)
        if ('string' == type(args)) then
            vim.cmd(('hi! link %s %s'):format(hlgroup, args))
            return
        end

        local fg, bg, attr, sp = args.fg or nil, args.bg or nil, args.attr or nil, args.sp or nil
        local cmd = {'hi', hlgroup}
        if fg then table.insert(cmd, 'guifg='..fg) end
        if bg then table.insert(cmd, 'guibg='..bg) end
        if attr then table.insert(cmd, 'gui='..attr) end
        if sp then table.insert(cmd, 'guisp='..sp) end
        vim.cmd(table.concat(cmd, ' '))
    end
})

--- Creates a base16 colorscheme using the colors specified.
--
-- Builtin colorschemes can be found in the M.colorschemes table.
--
-- The default Vim highlight groups (including User[1-9]), highlight groups
-- pertaining to Neovim's builtin LSP, and highlight groups pertaining to
-- Treesitter will be defined.
--
-- It's worth noting that many colorschemes will specify language specific
-- highlight groups like rubyConstant or pythonInclude. However, I don't do
-- that here since these should instead be linked to an existing highlight
-- group.
--
-- @param colors (table) table with keys 'base00', 'base01', 'base02',
--   'base03', 'base04', 'base05', 'base06', 'base07', 'base08', 'base09', 'base0A', 'base0B', 'base0C', 'base0D', 'base0E', 'base0F'. Each key should
--   map to a valid 6 digit hex color. If a string is provided, the
--   corresponding table specifying the colorscheme will be used.
function M.setup(colors)
    if type(colors) == 'string' then
        colors = M.colorschemes[colors]
    end

    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end
    vim.cmd('set termguicolors')

    M.colors = colors or M.colorschemes[vim.env.BASE16_THEME] or M.colorschemes['schemer-dark']
    local hi = M.highlight
    local p = M.colors
    if p.base10 ~= nil then
        p.base10 = p.base05
    end
    if p.base11 ~= nil then
        p.base11 = p.base08
    end

    -- Vim editor colors
    hi.Normal       = { fg = p.base05, bg = p.base00, attr = nil,    sp = nil }
    hi.Bold         = { fg = nil,      bg = nil,      attr = 'bold', sp = nil }
    hi.Debug        = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.Directory    = { fg = p.base0D, bg = nil,      attr = nil,    sp = nil }
    hi.Error        = { fg = p.base08, bg = p.base00, attr = nil,    sp = nil }
    hi.ErrorMsg     = { fg = p.base08, bg = p.base00, attr = nil,    sp = nil }
    hi.Exception    = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.FoldColumn   = { fg = p.base0C, bg = p.base00, attr = nil,    sp = nil }
    hi.Folded       = { fg = p.base03, bg = p.base01, attr = nil,    sp = nil }
    hi.IncSearch    = { fg = p.base01, bg = p.base09, attr = 'none', sp = nil }
    hi.Italic       = { fg = nil,      bg = nil,      attr = 'none', sp = nil }
    hi.Macro        = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.MatchParen   = { fg = nil,      bg = p.base03, attr = nil,    sp = nil }
    hi.ModeMsg      = { fg = p.base0B, bg = nil,      attr = nil,    sp = nil }
    hi.MoreMsg      = { fg = p.base0B, bg = nil,      attr = nil,    sp = nil }
    hi.Question     = { fg = p.base0D, bg = nil,      attr = nil,    sp = nil }
    hi.Search       = { fg = p.base01, bg = p.base0A, attr = nil,    sp = nil }
    hi.Substitute   = { fg = p.base01, bg = p.base0A, attr = 'none', sp = nil }
    hi.SpecialKey   = { fg = p.base03, bg = nil,      attr = nil,    sp = nil }
    hi.TooLong      = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.Underlined   = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.Visual       = { fg = nil,      bg = p.base02, attr = nil,    sp = nil }
    hi.VisualNOS    = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.WarningMsg   = { fg = p.base08, bg = nil,      attr = nil,    sp = nil }
    hi.WildMenu     = { fg = p.base08, bg = p.base0A, attr = nil,    sp = nil }
    hi.Title        = { fg = p.base0D, bg = nil,      attr = 'none', sp = nil }
    hi.Conceal      = { fg = p.base0D, bg = p.base00, attr = nil,    sp = nil }
    hi.Cursor       = { fg = p.base00, bg = p.base05, attr = nil,    sp = nil }
    hi.NonText      = { fg = p.base03, bg = p.base00, attr = nil,    sp = nil }
    hi.LineNr       = { fg = p.base04, bg = p.base00, attr = nil,    sp = nil }
    hi.SignColumn   = { fg = p.base04, bg = p.base00, attr = nil,    sp = nil }
    hi.StatusLine   = { fg = p.base05, bg = p.base02, attr = 'none', sp = nil }
    hi.StatusLineNC = { fg = p.base04, bg = p.base01, attr = 'none', sp = nil }
    hi.VertSplit    = { fg = p.base05, bg = p.base00, attr = 'none', sp = nil }
    hi.ColorColumn  = { fg = nil,      bg = p.base01, attr = 'none', sp = nil }
    hi.CursorColumn = { fg = nil,      bg = p.base01, attr = 'none', sp = nil }
    hi.CursorLine   = { fg = nil,      bg = p.base01, attr = 'none', sp = nil }
    hi.CursorLineNr = { fg = p.base04, bg = p.base01, attr = nil,    sp = nil }
    hi.QuickFixLine = { fg = nil,      bg = p.base01, attr = 'none', sp = nil }
    hi.PMenu        = { fg = p.base05, bg = p.base01, attr = 'none', sp = nil }
    hi.PMenuSel     = { fg = p.base01, bg = p.base05, attr = nil,    sp = nil }
    hi.PMenuSbar    = { fg = nil,      bg = p.base03, attr = nil,    sp = nil }
    hi.PMenuThumb   = { fg = nil,      bg = p.base03, attr = nil,    sp = nil }
    hi.TabLine      = { fg = p.base03, bg = p.base01, attr = 'none', sp = nil }
    hi.TabLineFill  = { fg = p.base03, bg = p.base01, attr = 'none', sp = nil }
    hi.TabLineSel   = { fg = p.base0B, bg = p.base01, attr = 'none', sp = nil }

    -- Standard syntax highlighting
    hi.Boolean      = { fg = p.base09, bg = nil,      attr = nil,    sp = nil }
    hi.Character    = { fg = p.base04, bg = nil,      attr = nil,    sp = nil }
    hi.Comment      = { fg = p.base03, bg = nil,      attr = nil,    sp = nil }
    hi.Conditional  = { fg = p.base0E, bg = nil,      attr = nil,    sp = nil }
    hi.Constant     = { fg = p.base09, bg = nil,      attr = nil,    sp = nil }
    hi.Define       = { fg = p.base0E, bg = nil,      attr = 'none', sp = nil }
    hi.Delimiter    = { fg = p.base0F, bg = nil,      attr = nil,    sp = nil }
    hi.Float        = { fg = p.base09, bg = nil,      attr = nil,    sp = nil }
    hi.Function     = { fg = p.base0D, bg = nil,      attr = nil,    sp = nil }
    hi.Identifier   = { fg = p.base11, bg = nil,      attr = 'none', sp = nil }
    hi.Include      = { fg = p.base0C, bg = nil,      attr = nil,    sp = nil }
    hi.Keyword      = { fg = p.base0E, bg = nil,      attr = nil,    sp = nil }
    hi.Label        = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.Number       = { fg = p.base09, bg = nil,      attr = nil,    sp = nil }
    hi.Operator     = { fg = p.base05, bg = nil,      attr = 'none', sp = nil }
    hi.PreProc      = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.Repeat       = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.Special      = { fg = p.base0C, bg = nil,      attr = nil,    sp = nil }
    hi.SpecialChar  = { fg = p.base04, bg = nil,      attr = nil,    sp = nil }
    hi.Statement    = { fg = p.base11, bg = nil,      attr = nil,    sp = nil }
    hi.StorageClass = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.String       = { fg = p.base0B, bg = nil,      attr = nil,    sp = nil }
    hi.Structure    = { fg = p.base0E, bg = nil,      attr = nil,    sp = nil }
    hi.Tag          = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.Todo         = { fg = p.base0A, bg = p.base01, attr = nil,    sp = nil }
    hi.Type         = { fg = p.base0A, bg = nil,      attr = 'none', sp = nil }
    hi.Typedef      = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.Ignore = 'Comment'

    -- Diff highlighting
    hi.DiffChange  = { fg = p.base03, bg = p.base00, attr = nil, sp = nil }
    hi.DiffDelete  = { fg = p.base08, bg = p.base00, attr = nil, sp = nil }
    hi.DiffText    = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.DiffAdd     = { fg = p.base0B, bg = p.base00, attr = nil, sp = nil }
    hi.DiffAdded   = { fg = p.base0B, bg = p.base00, attr = nil, sp = nil }
    hi.DiffFile    = { fg = p.base08, bg = p.base00, attr = nil, sp = nil }
    hi.DiffNewFile = { fg = p.base0B, bg = p.base00, attr = nil, sp = nil }
    hi.DiffLine    = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.DiffRemoved = { fg = p.base08, bg = p.base00, attr = nil, sp = nil }

    -- Spelling highlighting
    hi.SpellBad   = { fg = nil, bg = nil, attr = 'undercurl', sp = p.base08 }
    hi.SpellLocal = { fg = nil, bg = nil, attr = 'undercurl', sp = p.base0C }
    hi.SpellCap   = { fg = nil, bg = nil, attr = 'undercurl', sp = p.base0D }
    hi.SpellRare  = { fg = nil, bg = nil, attr = 'undercurl', sp = p.base0E }

    hi.DiagnosticError                    = { fg = p.base08, bg = p.base00, attr = 'none',      sp = nil }
    hi.DiagnosticWarn                     = { fg = p.base0E, bg = nil,      attr = 'none',      sp = nil }
    hi.DiagnosticInfo                     = { fg = p.base05, bg = nil,      attr = 'none',      sp = nil }
    hi.DiagnosticHint                     = { fg = p.base0C, bg = nil,      attr = 'none',      sp = nil }
    hi.DiagnosticUnderlineError           = { fg = nil,      bg = nil,      attr = 'undercurl', sp = p.base08 }
    hi.DiagnosticUnderlineWarning         = { fg = nil,      bg = nil,      attr = 'undercurl', sp = p.base0E }
    hi.DiagnosticUnderlineWarn            = { fg = nil,      bg = nil,      attr = 'undercurl', sp = p.base0E }
    hi.DiagnosticUnderlineInformation     = { fg = nil,      bg = nil,      attr = 'undercurl', sp = p.base0F }
    hi.DiagnosticUnderlineHint            = { fg = nil,      bg = nil,      attr = 'undercurl', sp = p.base0C }

    hi.LspReferenceText                   = { fg = nil,      bg = nil,      attr = 'underline', sp = p.base04 }
    hi.LspReferenceRead                   = { fg = nil,      bg = nil,      attr = 'underline', sp = p.base04 }
    hi.LspReferenceWrite                  = { fg = nil,      bg = nil,      attr = 'underline', sp = p.base04 }
    hi.LspDiagnosticsDefaultError         = 'DiagnosticError'
    hi.LspDiagnosticsDefaultWarning       = 'DiagnosticWarn'
    hi.LspDiagnosticsDefaultInformation   = 'DiagnosticInfo'
    hi.LspDiagnosticsDefaultHint          = 'DiagnosticHint'
    hi.LspDiagnosticsUnderlineError       = 'DiagnosticUnderlineError'
    hi.LspDiagnosticsUnderlineWarning     = 'DiagnosticUnderlineWarning'
    hi.LspDiagnosticsUnderlineInformation = 'DiagnosticUnderlineInformation'
    hi.LspDiagnosticsUnderlineHint        = 'DiagnosticUnderlineHint'

    hi.TSAnnotation         = { fg = p.base0F, bg = nil, attr = 'none',          sp = nil }
    hi.TSAttribute          = { fg = p.base0A, bg = nil, attr = 'none',          sp = nil }
    hi["@tag.attribute"]    = { fg = p.base0A, bg = nil, attr = 'none',          sp = nil }
    hi["@attr"]             = { fg = p.base0A, bg = nil, attr = 'none',          sp = nil }
    hi.TSBoolean            = 'Boolean'
    hi.TSCharacter          = 'Character'
    hi.TSComment            = 'Comment'
    hi.TSConstructor        = { fg = p.base0D, bg = nil, attr = 'none',          sp = nil }
    hi.TSConditional        = 'Conditional'
    hi.TSConstant           = { fg = p.base09, bg = nil, attr = 'none',          sp = nil }
    hi.TSConstBuiltin       = { fg = p.base09, bg = nil, attr = 'italic',        sp = nil }
    hi.TSConstMacro         = { fg = p.base11, bg = nil, attr = 'none',          sp = nil }
    hi.TSError              = 'Error'
    hi.TSException          = 'Exception'
    hi.TSField              = { fg = p.base10, bg = nil, attr = 'none',          sp = nil }
    hi["@field"]            = { fg = p.base10, bg = nil, attr = 'none',          sp = nil }
    hi.TSFloat              = 'Float'
    hi.TSFunction           = 'Function'
    hi.TSFuncBuiltin        = 'Function'
    hi.TSFuncMacro          = 'Function'
    hi.TSInclude            = 'Include'
    hi.TSKeyword            = 'Keyword'
    hi.TSKeywordFunction    = 'Keyword'
    hi.TSKeywordOperator    = 'Keyword'
    hi.TSLabel              = 'Title'
    hi.TSMethod             = 'Function'
    hi.TSNamespace          = { fg = p.base04, bg = nil, attr = 'none',          sp = nil }
    hi.TSNone               = { fg = p.base05, bg = nil, attr = 'none',          sp = nil }
    hi.TSNumber             = 'Number'
    hi.TSOperator           = 'Operator'
    hi.TSParameter          = { fg = p.base10, bg = nil, attr = 'none',          sp = nil }
    hi["@parameter"]        = { fg = p.base10, bg = nil, attr = 'none',          sp = nil }
    hi.TSParameterReference = 'TSParameter'
    hi.TSProperty           = 'TSField'
    hi.TSPunctDelimiter     = 'Delimiter'
    hi.TSPunctBracket       = 'Delimiter'
    hi.TSPunctSpecial       = 'Delimiter'
    hi.TSRepeat             = 'Repeat'
    hi.TSString             = 'String'
    hi.TSStringRegex        = { fg = p.base0C, bg = nil, attr = 'none',          sp = nil }
    hi.TSStringEscape       = 'SpecialChar'
    hi.TSSymbol             = { fg = p.base0B, bg = nil, attr = 'none',          sp = nil }
    hi.TSTag                = 'Tag'
    hi["@tag"]              = 'Tag'
    hi.TSTagDelimiter       = 'Delimiter'
    hi.TSText               = { fg = p.base05, bg = nil, attr = 'none',          sp = nil }
    hi.TSStrong             = { fg = nil,      bg = nil, attr = 'bold',          sp = nil }
    hi.TSEmphasis           = { fg = p.base09, bg = nil, attr = 'italic',        sp = nil }
    hi.TSUnderline          = { fg = p.base00, bg = nil, attr = 'underline',     sp = nil }
    hi.TSStrike             = { fg = p.base00, bg = nil, attr = 'strikethrough', sp = nil }
    hi.TSTitle              = 'Title'
    hi.TSLiteral            = { fg = p.base09, bg = nil, attr = 'none',          sp = nil }
    hi.TSURI                = { fg = p.base09, bg = nil, attr = 'underline',     sp = nil }
    hi.TSType               = 'Type'
    hi.TSTypeBuiltin        = 'Type'
    hi.TSVariable           = { fg = p.base05, bg = nil, attr = 'none',          sp = nil }
    hi["@variable"]         = { fg = p.base05, bg = nil, attr = 'none',          sp = nil }
    hi.TSVariableBuiltin    = 'TSVariable'
    hi.TSDefinition         = { fg = nil,      bg = nil, attr = 'underline',     sp = p.base04 }
    hi.TSDefinitionUsage    = { fg = nil,      bg = nil, attr = 'underline',     sp = p.base04 }
    hi.TSCurrentScope       = { fg = nil,      bg = nil, attr = 'bold',          sp = nil }

    hi.NvimInternalError = { fg = p.base00, bg = p.base08, attr = 'none', sp = nil }

    hi.NormalFloat  = { fg = p.base05, bg = p.base00, attr = nil,    sp = nil }
    hi.FloatBorder  = { fg = p.base05, bg = p.base00, attr = nil,    sp = nil }
    hi.NormalNC     = { fg = p.base05, bg = p.base00, attr = nil,    sp = nil }
    hi.TermCursor   = { fg = p.base00, bg = p.base05, attr = 'none', sp = nil }
    hi.TermCursorNC = { fg = p.base00, bg = p.base05, attr = nil,    sp = nil }

    hi.User1 = { fg = p.base08, bg = p.base02, attr = 'none', sp = nil }
    hi.User2 = { fg = p.base0E, bg = p.base02, attr = 'none', sp = nil }
    hi.User3 = { fg = p.base05, bg = p.base02, attr = 'none', sp = nil }
    hi.User4 = { fg = p.base0C, bg = p.base02, attr = 'none', sp = nil }
    hi.User5 = { fg = p.base01, bg = p.base02, attr = 'none', sp = nil }
    hi.User6 = { fg = p.base05, bg = p.base02, attr = 'none', sp = nil }
    hi.User7 = { fg = p.base05, bg = p.base02, attr = 'none', sp = nil }
    hi.User8 = { fg = p.base00, bg = p.base02, attr = 'none', sp = nil }
    hi.User9 = { fg = p.base00, bg = p.base02, attr = 'none', sp = nil }

    hi.TreesitterContext = { fg = nil, bg = p.base01, attr = 'italic', sp = nil }

    vim.g.terminal_color_0  = p.base00
    vim.g.terminal_color_1  = p.base08
    vim.g.terminal_color_3  = p.base0A
    vim.g.terminal_color_4  = p.base0D
    vim.g.terminal_color_5  = p.base0E
    vim.g.terminal_color_6  = p.base0C
    vim.g.terminal_color_7  = p.base05
    vim.g.terminal_color_8  = p.base03
    vim.g.terminal_color_9  = p.base08
    vim.g.terminal_color_10 = p.base0B
    vim.g.terminal_color_11 = p.base0A
    vim.g.terminal_color_12 = p.base0D
    vim.g.terminal_color_13 = p.base0E
    vim.g.terminal_color_14 = p.base0C
    vim.g.terminal_color_15 = p.base07

    -- Plugin specific

    -- GitGutter and GitSigns highlighting
    hi.GitGutterAdd          = { fg = p.base0B, bg = p.base00, attr = nil, sp = nil }
    hi.GitGutterChange       = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.GitGutterDelete       = { fg = p.base08, bg = p.base00, attr = nil, sp = nil }
    hi.GitGutterChangeDelete = { fg = p.base0E, bg = p.base00, attr = nil, sp = nil }

    hi.GitSignsAdd           = { fg = p.base0B, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsAddNr         = { fg = p.base0B, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsAddLn         = { fg = p.base0B, bg = p.base00, attr = 'bold', sp = nil }
    hi.GitSignsAddInline     = 'GitSignsAdd'
    hi.GitSignsChange        = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsChangeNr      = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsChangeLn      = { fg = p.base0D, bg = p.base00, attr = 'bold', sp = nil }
    hi.GitSignsDelete        = { fg = p.base08, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsDeleteNr      = { fg = p.base08, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsDeleteLn      = { fg = p.base08, bg = p.base00, attr = 'bold', sp = nil }
    hi.GitSignsDeleteInline  = 'GitSignsDelete'
    hi.GitSignsUntracked     = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsUntrackedNr     = { fg = p.base0D, bg = p.base00, attr = nil, sp = nil }
    hi.GitSignsUntrackedLn   = { fg = p.base0D, bg = p.base00, attr = 'bold', sp = nil }
    hi.GitSignsUntrackedInline  = 'GitSignsUntracked'

    -- Git highlighting
    hi.gitcommitOverflow      = { fg = p.base08, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitSummary       = { fg = p.base0B, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitComment       = { fg = p.base03, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitUntracked     = { fg = p.base03, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitDiscarded     = { fg = p.base03, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitSelected      = { fg = p.base03, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitHeader        = { fg = p.base0E, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitSelectedType  = { fg = p.base0D, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitUnmergedType  = { fg = p.base0D, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitDiscardedType = { fg = p.base0D, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitBranch        = { fg = p.base09, bg = nil, attr = 'bold', sp = nil }
    hi.gitcommitUntrackedFile = { fg = p.base0A, bg = nil, attr = nil,    sp = nil }
    hi.gitcommitUnmergedFile  = { fg = p.base08, bg = nil, attr = 'bold', sp = nil }
    hi.gitcommitDiscardedFile = { fg = p.base08, bg = nil, attr = 'bold', sp = nil }
    hi.gitcommitSelectedFile  = { fg = p.base0B, bg = nil, attr = 'bold', sp = nil }

    -- Cmp highlight
    -- hi.CmpItemAbbrMatch      = { fg = '#569cd6', bg = nil, attr = nil, sp = nil }
    -- hi.CmpItemAbbrMatchFuzzy = { fg = '#569cd6', bg = nil, attr = nil, sp = nil }
    -- hi.CmpItemKindFunction   = { fg = '#c586c0', bg = nil, attr = nil, sp = nil }
    -- hi.CmpItemKindMethod     = { fg = '#c586c0', bg = nil, attr = nil, sp = nil }
    -- hi.CmpItemKindVariable   = { fg = '#9cdcfe', bg = nil, attr = nil, sp = nil }
    -- hi.CmpItemKindKeyword    = { fg = '#d4d4d4', bg = nil, attr = nil, sp = nil }
    hi.CmpItemAbbr              = { fg = p.base05, bg = nil,      attr = nil,    sp = nil }
    hi.CmpItemAbbrDeprecated    = { fg = p.base03, bg = nil,      attr = nil,    sp = nil }
    hi.CmpItemAbbrMatch         = { fg = p.base0A, bg = nil,      attr = 'bold', sp = nil }
    hi.CmpItemAbbrMatchFuzzy    = { fg = p.base0A, bg = nil,      attr = 'bold', sp = nil }
    hi.CmpItemKind              = { fg = p.base0F, bg = p.base01, attr = nil,    sp = nil }
    hi.CmpItemMenu              = { fg = p.base05, bg = p.base01, attr = nil,    sp = nil }
    hi.CmpItemKindClass         = 'Type'
    hi.CmpItemKindColor         = 'Special'
    hi.CmpItemKindConstant      = 'Constant'
    hi.CmpItemKindConstructor   = 'Type'
    hi.CmpItemKindEnum          = 'Structure'
    hi.CmpItemKindEnumMember    = 'Structure'
    hi.CmpItemKindEvent         = 'Exception'
    hi.CmpItemKindField         = 'Structure'
    hi.CmpItemKindFile          = 'Tag'
    hi.CmpItemKindFolder        = 'Directory'
    hi.CmpItemKindFunction      = 'Function'
    hi.CmpItemKindInterface     = 'Structure'
    hi.CmpItemKindKeyword       = 'Keyword'
    hi.CmpItemKindMethod        = 'Function'
    hi.CmpItemKindModule        = 'Structure'
    hi.CmpItemKindOperator      = 'Operator'
    hi.CmpItemKindProperty      = 'Structure'
    hi.CmpItemKindReference     = 'Tag'
    hi.CmpItemKindSnippet       = 'Special'
    hi.CmpItemKindStruct        = 'Structure'
    hi.CmpItemKindText          = 'Statement'
    hi.CmpItemKindTypeParameter = 'Type'
    hi.CmpItemKindUnit          = 'Special'
    hi.CmpItemKindValue         = 'Identifier'
    hi.CmpItemKindVariable      = 'Delimiter'

    -- TSRainbow
    hi.TSRainbowRed    = { fg = '#c0c063', bg = nil, attr = nil, sp = nil }
    hi.TSRainbowYellow = { fg = '#71cf8d', bg = nil, attr = nil, sp = nil }
    hi.TSRainbowBlue   = { fg = '#13d4d0', bg = nil, attr = nil, sp = nil }
    hi.TSRainbowOrange = { fg = '#82c2f7', bg = nil, attr = nil, sp = nil }
    hi.TSRainbowGreen  = { fg = '#daa9f7', bg = nil, attr = nil, sp = nil }
    hi.TSRainbowViolet = { fg = '#fe9ec9', bg = nil, attr = nil, sp = nil }
    hi.TSRainbowCyan   = { fg = '#f1ac88', bg = nil, attr = nil, sp = nil }

    -- Telescope
    hi.TelescopeBorder         = { fg = p.base0F, bg = nil,      attr = nil,    sp = nil }
    hi.TelescopeMatching       = { fg = p.base0A, bg = nil,      attr = nil,    sp = nil }
    hi.TelescopeMultiSelection = { fg = nil,      bg = p.base01, attr = 'bold', sp = nil }
    hi.TelescopeSelection      = { fg = nil,      bg = p.base01, attr = 'bold', sp = nil }

    -- NvimTree
    hi.NvimTreeExecFile     = { fg = p.base0B, bg = nil,      attr = 'bold',           sp = nil }
    hi.NvimTreeFolderIcon   = { fg = p.base03, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeGitDeleted   = { fg = p.base08, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeGitDirty     = { fg = p.base08, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeGitMerge     = { fg = p.base0C, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeGitNew       = { fg = p.base0A, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeGitRenamed   = { fg = p.base0E, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeGitStaged    = { fg = p.base0B, bg = nil,      attr = nil,              sp = nil }
    hi.NvimTreeImageFile    = { fg = p.base0E, bg = nil,      attr = 'bold',           sp = nil }
    hi.NvimTreeIndentMarker = 'NvimTreeFolderIcon'
    hi.NvimTreeOpenedFile   = 'NvimTreeExecFile'
    hi.NvimTreeRootFolder   = 'NvimTreeGitRenamed'
    hi.NvimTreeSpecialFile  = { fg = p.base0D, bg = nil,      attr = 'bold,underline', sp = nil }
    hi.NvimTreeSymlink      = { fg = p.base0F, bg = nil,      attr = 'bold',           sp = nil }
    hi.NvimTreeWindowPicker = { fg = p.base05, bg = p.base01, attr = "bold",           sp = nil }

    -- Indent-Blankline
    hi.IndentBlanklineChar         = { fg = p.base02, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineContextChar  = { fg = p.base0F, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineContextStart = { fg = nil,      bg = nil, attr = 'underline,nocombine', sp = p.base0F }
    hi.IndentBlanklineIndent1      = { fg = p.base08, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent2      = { fg = p.base09, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent3      = { fg = p.base0A, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent4      = { fg = p.base0B, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent5      = { fg = p.base0C, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent6      = { fg = p.base0D, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent7      = { fg = p.base0E, bg = nil, attr = 'nocombine',           sp = nil }
    hi.IndentBlanklineIndent8      = { fg = p.base0F, bg = nil, attr = 'nocombine',           sp = nil }

    -- DAP UI
    hi.DapUIScope                   = 'Title'
    hi.DapUIType                    = 'Type'
    hi.DapUIModifiedValue           = { fg = p.base0E, bg = nil, attr = 'bold', sp = nil }
    hi.DapUIDecoration              = 'Title'
    hi.DapUIThread                  = 'String'
    hi.DapUIStoppedThread           = 'Title'
    hi.DapUISource                  = 'Directory'
    hi.DapUILineNumber              = 'Title'
    hi.DapUIFloatBorder             = 'SpecialChar'
    hi.DapUIWatchesEmpty            = 'ErrorMsg'
    hi.DapUIWatchesValue            = 'String'
    hi.DapUIWatchesError            = 'DiagnosticError'
    hi.DapUIBreakpointsPath         = 'Directory'
    hi.DapUIBreakpointsInfo         = 'DiagnosticInfo'
    hi.DapUIBreakpointsCurrentLine  = { fg = p.base0B, bg = nil, attr = 'bold', sp = nil }
    hi.DapUIBreakpointsDisabledLine = 'Comment'
end

function M.available_colorschemes()
  return vim.tbl_keys(M.colorschemes)
end

M.colorschemes = {}
setmetatable(M.colorschemes, {
    __index = function(t, key)
        t[key] = require(string.format('colors.%s', key))
        return t[key]
    end,
})

return M
