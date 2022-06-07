local utils = require('utils')

vim.g.vimwiki_list = {{path='~/Documents/Notes/main.wiki',
                      template_path='~/Documents/Notes/main.wiki/templates',
                      template_default='default',
                      template_ext='.html'}}

vim.cmd 'au BufRead, BufNewFile *.wiki set filetype=vimwiki'
