hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "toystars"
set background=dark

"very dark guibg=#001a25
"dark guibg=#002635
" base {{{
hi Normal guifg=#23d183 ctermbg=235 guibg=#2c3f58 gui=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#194b5e ctermbg=23 gui=NONE cterm=NONE

hi ColorColumn guifg=NONE ctermfg=NONE guibg=#002635 ctermbg=234 gui=NONE cterm=NONE
hi Cursor guifg=NONE ctermfg=NONE guibg=#db8e27
hi CursorIM guifg=NONE ctermfg=NONE guibg=#db8e27
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#002635 ctermbg=234 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#002635 ctermbg=234 gui=NONE cterm=NONE
hi CursorLineNr guifg=#34a6da guibg=NONE
hi LineNr guifg=#77929e ctermfg=246 guibg=#2c3f58 ctermbg=235 gui=NONE cterm=NONE

hi VertSplit gui=NONE guifg=#002635 guibg=NONE
hi Folded guifg=#23d183 guibg=#002635
hi FoldColumn guifg=#35a08f guibg=#002635 ctermbg=235
hi SignColumn guibg=#2c3f58
hi IncSearch guifg=#e7d84b guibg=NONE
hi Search guibg=#336889 guifg=#42c3ae
hi MatchParen guifg=#e7d84b guibg=NONE
hi NonText guifg=#325d96 guibg=#2c3f58
hi Conceal guifg=#1a9172 guibg=#2c3f58

hi Pmenu guifg=#1a9172 guibg=#00384d
hi PMenuSel guifg=#42c3ae guibg=#002635 
hi PMenuSbar guifg=NONE guibg=#336889
hi PMenuThumb guifg=NONE guibg=#42c3ae
hi WildMenu guifg=#1a9172 guibg=#00384d

hi DiffAdd guifg=#1a9172 guibg=NONE
hi link diffAdded DiffAdd
hi DiffChange guifg=#e75c3d guibg=NONE
hi DiffDelete guifg=#be2d26 guibg=NONE
hi link diffRemoved DiffDelete
hi DiffText guifg=#be2d26 guibg=NONE

hi WarningMsg guifg=#e75c3d guibg=NONE
hi ErrorMsg guifg=#be2d26 guibg=NONE
hi MsgArea guifg=None guibg=#2c3f58
hi MsgSeparator guifg=None guibg=#2c3f58
hi link Question Normal
hi MoreMsg guifg=#db8e27 guibg=NONE
hi QuickFixLine guifg=#c44fa1 guibg=#2c3f58

hi SpellBad guifg=#c44fa1 guibg=NONE gui=underline cterm=underline
hi link SpellLocal SpellBad
hi link SpellCap SpellBad
hi link SpellRare SpellBad

hi TabLine guifg=#325d96 guibg=#002635 gui=NONE
hi TabLineFill gui=NONE guibg=#002635 
hi TabLineSel guifg=#34a6da guibg=#2c3f58 gui=bold
hi StatusLine guifg=#23d183  guibg=#2c3f58 gui=bold
hi StatusLineNC guifg=#23d183 guibg=#002635 gui=NONE

hi Title guifg=#946ed9

hi Directory guifg=#946ed9 guibg=NONE
hi Comment guifg=#336889 guibg=NONE gui=italic
hi SpecialComment guifg=#40bf44 guibg=NONE gui=italic

hi Constant guifg=#1a9172 guibg=NONE
hi Boolean guifg=#42c3ae guibg=NONE
hi String guifg=#c44fa1 guibg=NONE gui=italic
hi link Character String
hi Number guifg=#e75c3d guibg=NONE
hi link Float Number

hi Identifier guifg=#1c8db2 ctermfg=31 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#34a6da guibg=NONE

hi Statement guifg=#db8e27 guibg=NONE gui=bold
hi Conditional guifg=#e7d84b guibg=NONE
hi Repeat guifg=#e7d84b guibg=NONE
hi Label guifg=#db8e27 guibg=NONE
hi Operator guifg=#35a08f guibg=NONE
hi Keyword guifg=#1a9172 guibg=NONE
hi Exception guifg=#be2d26 guibg=NONE


hi PreProc guifg=#e75c3d guibg=NONE
hi link PreCondit Preproc
hi Include guifg=#946ed9 guibg=NONE
hi Define guifg=#db8e27 guibg=NONE
hi Macro guifg=#db8e27 guibg=NONE

hi Type guifg=#1c8db2 ctermfg=31 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link StorageClass Keyword
hi Storage guifg=#946ed9 guibg=NONE
hi Structure guifg=#be2d26 guibg=NONE
hi Typedef guifg=#be2d26 guibg=NONE

hi Special guifg=#db8e27 guibg=NONE
hi SpecialChar guifg=#db8e27 guibg=NONE
hi Tag guifg=#db8e27 guibg=NONE
hi Delimiter guifg=#db8e27 guibg=NONE
hi Debug guifg=#c44fa1 guibg=NONE

hi Underlined guifg=#34a6da ctermfg=153 guibg=NONE ctermbg=NONE gui=underline cterm=underline

hi link Ignore Comment

hi Todo guifg=#2c3f58 guibg=#db8e27 gui=bold

hi Error guifg=#e6e6dc guibg=#ff2d26

hi link HelpCommand Title
hi HelpExample guifg=#34a6da guibg=NONE
" }}}

" LSP {{{
hi link LspDiagnosticsError Error
hi link LspDiagnosticsError Error
hi link LspDiagnosticsErrorFloating Error
hi link LspDiagnosticsWarning WarningMsg
hi link LspDiagnosticsWarningSign WarningMsg
hi link LspDiagnosticsWarningFloating WarningMsg
hi link LspDiagnosticsInformation PMenuSel
hi link LspDiagnosticsInformationSign PMenuSel
hi link LspDiagnosticsInformationFloating PMenuSel
hi link LspDiagnosticsHint CursorLineNr
hi link LspDiagnosticsHintSign CursorLineNr
hi link LspDiagnosticsHintFloating CursorLineNr
hi link LspReferenceText Normal
hi link LspReferenceRead Normal
hi link LspReferenceWrite Normal
" }}}

" Treesitter {{{
hi link TSError Warning
hi link TSPunctBracket Delimiter
hi link TSPunctSpecial SpecialChar
hi link linkTSConstant Constant
hi TSConstBuiltin guifg=#40bf44 guibg=NONE gui=italic
hi link TSConstMacro Macro
hi link TSString String
hi TSStringRegex guifg=#946ed9 guibg=NONE gui=NONE
hi link TSStringEscape SpecialChar
hi link TSCharacter Character
hi link TSNumber Number
hi link TSBoolean Boolean
hi link TSFloat Float
hi link TSFunction Function
hi link TSFuncBuiltin Function
hi link TSFuncMacro Function
hi TSParameter guifg=#35a08f guibg=NONE gui=NONE
hi link TSMethod Function
hi link TSField Identifier
hi link TSProperty TSField
hi TSConstructor guifg=#946ed9 guibg=NONE gui=italic
hi link TSConditional Conditional
hi link TSRepeat Repeat
hi link TSLabel Title
hi link TSOperator Operator
hi link TSKeyword Keyword
hi link TSException Exception
hi link TSType Type
hi link TSTypeBuiltin Type
hi link TSStructure Structure
hi link TSInclude Include
" }}}

" gitgutter {{{
hi GitGutterAdd guifg=#1a9172 guibg=NONE
hi GitGutterChange guifg=#db8e27 guibg=NONE
hi GitGutterDelete guifg=#be2d26 guibg=NONE
hi GitGutterChangeDelete guifg=#be2d26 guibg=NONE
" }}}

" latex {{{
hi texStatement guifg=#db8e27 guibg=NONE gui=italic
hi texNewCmd guifg=#db8e27 guibg=NONE gui=italic
hi texCmdName guifg=#db8e27 guibg=NONE gui=bold
hi texBeginEnd guifg=#be2d26 guibg=NONE gui=bold
hi texBeginEndName guifg=#34a6da guibg=NONE
hi texBeginEndModifier guifg=#c44fa1 guibg=NONE
hi texSection guifg=#e75c3d guibg=NONE gui=italic
hi texDocType guifg=#35a08f guibg=NONE
hi texDocTypeArgs guifg=#e75c3d guibg=NONE
hi link texTitle Title
hi texMathZoneAmsAS guifg=#db8e27 guibg=NONE gui=NONE
hi texSuperscripts guifg=#db8e27 guibg=NONE gui=NONE
hi texItalStyle guifg=#23d183 guibg=NONE gui=italic
hi texBoldStyle guifg=#23d183 guibg=NONE gui=bold
" }}}

" python {{{
" base python {{{
hi link pythonInclude Include
hi pythonBuiltin guifg=#40bf44 guibg=none gui=none
hi link pythonrepeat repeat
hi link pythonexception exception
hi link pythondecorator statement
hi pythondecoratorname guifg=#1a9172 guibg=none gui=italic
hi link pythonfunction function
" }}}

" python-syntax: https://github.com/vim-python/python-syntax {{{
hi pythonexclass guifg=#e75c3d guibg=none
hi pythonbuiltintype guifg=#40bf44 guibg=none
hi link pythonbuiltinobj pythonbuiltintype
hi link pythondottedname pythondecoratorname
hi link pythonbuiltinfunc function
hi link pythonimport include
hi link pythonrun special
hi link pythoncoding special
hi link pythonoperator operator
hi link pythonconditional conditional
hi link pythonnone exeception
hi pythondot guifg=#c44fa1 guibg=none
" }}}
" }}}

" markdown {{{
hi markdownheadingdelimiter guifg=#34a6dc guibg=#002635 
hi markdownh1 guifg=#946ed9 guibg=#002635 gui=bold
hi markdownh2 guifg=#c44fa1 guibg=#002635 gui=bold
hi markdownh3 guifg=#34a6dc guibg=#002635 gui=bold
hi markdownh4 guifg=#34a6dc guibg=#002635 gui=none
hi link markdownh5 markdownh4
hi link markdownh6 markdownh4
hi link markdowncodedelimiter delimiter
hi markdowncode guifg=#1a9172 guibg=none
hi link markdownlinktext underlined
hi link markdownlinktextdelimiter delimiter
hi link markdownlinkdelimiter delimiter
"}}}

" css {{{
hi cssidentifier guifg=#be2d26 guibg=none
hi cssimportant guifg=#be2d26 guibg=none
hi cssincludekeyword guifg=#1a9172 guibg=none
hi csscolor guifg=#db8e27 guibg=none
hi cssclassname guifg=#946ed9 guibg=none
hi cssclassnamedot guifg=#946ed9 guibg=none
hi cssattr guifg=#35a08f guibg=none
" }}}


" set terminal colors {{{
if has('nvim')
    let g:terminal_color_foreground = "#e6e6dc"
    let g:terminal_color_background = "#002635"

    let g:terminal_color_0 = "#2c3f58"
    let g:terminal_color_8 = "#336889"

    let g:terminal_color_1 = "#be2d26"
    let g:terminal_color_9 = "#e75c3d"

    let g:terminal_color_2 = "#1a9172"
    let g:terminal_color_10 = "#40bf44"

    let g:terminal_color_3 = "#db8e27"
    let g:terminal_color_11 = "#e7d84b"

    let g:terminal_color_4 = "#325d96"
    let g:terminal_color_12 = "#34a6da"

    let g:terminal_color_5 = "#946ed9"
    let g:terminal_color_13 = "#c44fa1"

    let g:terminal_color_6 = "#35a08f"
    let g:terminal_color_14 = "#42c3ae"

    let g:terminal_color_7 = "#23d183"
    let g:terminal_color_15 = "#d5d5d5"
endif
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
