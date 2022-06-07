" Ensure that plugin/vimcmdline.vim was sourced
if !exists("g:cmdline_job")
    runtime plugin/vimcmdline.vim
endif

function! OcamlSourceLines(lines)
    call writefile(a:lines, g:cmdline_tmp_dir . "/lines.ml")
    call VimCmdLineSendCmd('#use "' . g:cmdline_tmp_dir . '/lines.ml";;')
endfunction

" Send current line to the interpreter and go down to the next non empty line
" function OcamlSendLine()
"     let line = getline(".")
"     if strlen(line) > 0 || b:cmdline_send_empty
"         let line = line . ';;'
"         call VimCmdLineSendCmd(line)
"     endif
"     call VimCmdLineDown()
" endfunction

let b:cmdline_nl = "\n"
let b:cmdline_app = "utop"
let b:cmdline_quit_cmd = "#quit;;"
" let b:cmdline_send = function("OcamlSendLine")
let b:cmdline_source_fun = function("OcamlSourceLines")
let b:cmdline_send_empty = 0
let b:cmdline_filetype = "ocaml"

exe 'nmap <buffer><silent> ' . g:cmdline_map_start . ' :call VimCmdLineStartApp()<CR>'

" Fixing bug
let g:cmdline_job.ocaml = 0
" call VimCmdLineSetApp("ocaml")
