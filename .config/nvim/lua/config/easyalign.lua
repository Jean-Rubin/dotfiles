local utils = require('utils')

-- Start interactive EasyAlign in visual mode (e.g. vipge)
utils.map('x', 'ge', '<Plug>(EasyAlign)', {noremap = false})
-- Start interactive EasyAlign for a motion/text object (e.g. geip)
utils.map('n', 'ge', '<Plug>(EasyAlign)', {noremap = false})
utils.map('v', 'ge', '<Plug>(EasyAlign)', {noremap = false})
