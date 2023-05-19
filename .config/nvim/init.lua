-- Leader map
vim.g.mapleader = ' '

--- Common Settings
require('settings')

--- Standard Keymappings
require('keymappings')

--- Plugins
require('plugins')

--- Plugin config
require('config')

--- Colorscheme
local colorscheme = require('colorscheme.chroma')
require('colorscheme').setup(colorscheme)

--- LSP
require('lsp')

--- Debug
require('dbg')
