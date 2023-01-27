local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup()

vim.keymap.set('', 'f', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
    })
end, {remap = true, desc = "Hop On after cursor"})

vim.keymap.set('', 'F', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
    })
end, {remap = true, desc = "Hop On before cursor"})

vim.keymap.set('', 't', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1,
    })
end, {remap = true, desc = "Hop Until after cursor"})

vim.keymap.set('', 'T', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1,
    })
end, {remap = true, desc = "Hop Until before cursor"})

vim.keymap.set('', 'T', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1,
    })
end, {remap = true, desc = "Hop Until before cursor"})

vim.keymap.set('', 's', hop.hint_char2, {remap = true, desc = "Hop with 2 chars"})

