local cmp_lsp = require('cmp_nvim_lsp')
local lsp_signature = require('lsp_signature')
local wk = require('which-key')


-- Define border
local border = {
    { "╭", "FloatBorder"},
    { "─", "FloatBorder"},
    { "╮", "FloatBorder"},
    { "│", "FloatBorder"},
    { "╯", "FloatBorder"},
    { "─", "FloatBorder"},
    { "╰", "FloatBorder"},
    { "│", "FloatBorder"}
}


-- Define signs on gutter
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end


-- Define common config for lsp
local M = {}

local rename_handler_helper = function(entries, msg_stack, edits, uri)
    local bufnr = vim.uri_to_bufnr(uri)
    local filename = vim.uri_to_fname(uri)
    local start_line = 0
    local line = 0

    for _, edit in ipairs(edits) do
        start_line = edit.range.start.line + 1
        line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]
        table.insert(entries, {
            bufnr = bufnr,
            lnum = start_line,
            col = edit.range.start.character,
            text = line
        })
    end
    msg_stack.msg = msg_stack.msg .. ("%d changes in %s"):format(#edits, filename) .. "\n"
    msg_stack.num_changes = msg_stack.num_changes + #edits

    return entries, msg_stack
end


local rename_handler_custom = function(err, result)
	if err then vim.notify(("Error running lsp query 'rename': "..err), vim.log.levels.ERROR) end

    if not result then
        return
    end

    local entries = {}
    local msg_stack = {
        msg = '',
        num_changes = 0
    }
    if result.documentChanges then
        for _, changes in ipairs(result.documentChanges) do
            local edits = changes.edits
            if edits then
                entries, msg_stack = rename_handler_helper(entries, msg_stack, edits, changes.textDocument.uri)
            end
        end
    elseif result.changes then
		for uri, edits in pairs(result.changes) do
            entries, msg_stack = rename_handler_helper(entries, msg_stack, edits, uri)
        end
	end
    msg_stack.msg = msg_stack.msg:sub(1, #msg_stack.msg - 1)
    vim.notify(msg_stack.msg, "info", {
      title = ("Succesfully renamed with %d changes"):format(msg_stack.num_changes),
    })
	vim.lsp.util.apply_workspace_edit(result, "utf-8")
    vim.fn.setqflist(entries, "r")
end


M.handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = '◉',
            source = 'if_many'}
    }),
    ["textDocument/rename"] = rename_handler_custom
}


function M.on_attach(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)

    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    -- buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', '<leader>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
    -- buf_set_keymap('n', '<leader>ca', '<cmd>CodeActionMenu<CR>', opts)

    -- buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '<leader>dd', '<cmd>lua require"telescope.builtin".lsp_document_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '<leader>dD', '<cmd>lua require"telescope.builtin".lsp_workspace_diagnostics()<CR>', opts)

    buf_set_keymap('n', ',d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ';d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    if client.server_capabilities.documentFormattingProvider then
        buf_set_keymap('n', '<space>=', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    end

    if client.server_capabilities.documentHighlightProvider then
        vim.cmd([[
          hi! link LspReferenceRead Visual
          hi! link LspReferenceText Visual
          hi! link LspReferenceWrite Visual
          augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]])
    end

    -- Add lsp_signature
    lsp_signature.on_attach({
        bind = true,
        hint_prefix = "⚙ ",
        handler_opts = {
            border = border
        }
    }, bufnr)

    -- Register keybindings
    wk.register {
        ['<leader>l'] = {
            name = 'Lsp',
            d = {'<cmd>lua require("telescope.builtin").diagnostics()<cr>', 'Document Wide Diagnostics'},
            qd = {'<cmd>lua vim.diagnostic.setqflist { open = true }<CR>', 'Global Quickfix Diagnostics'},
            D = {'<cmd>lua vim.diagnostic.open_float(nil, { focusable = false, close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }, border = "rounded", source = "always", prefix = " " })<CR>', 'Show Diagnostics'},
            c = {'<cmd>CodeActionMenu<cr>', 'Code Action Menu'},
            r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename Variable'}
        },
        ['<leader>lw'] = {
            name = 'workspace',
            a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add Workspace Folder'},
            r = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove Workspace Folder'},
            l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folder'}
        }
    }
end


M.capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())


return M
