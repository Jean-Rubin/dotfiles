setlocal shiftwidth=2
setlocal softtabstop=2
setlocal noautoindent
filetype indent off

nmap <silent> <Leader>rs <Plug>RStart
vmap <silent> <Leader>rs <Plug>RStart

nmap <silent> <Leader>rq :call RQuit("nosave")<CR>
vmap <silent> <Leader>rq :call RQuit("nosave")<CR>

" \rg plot
nmap <silent> <Leader>rg :call RAction("plot")<CR>
" \ra args
nmap <silent> <Leader>ra :call RAction("args")<CR>
" \rd setwd
nmap <silent> <Leader>rwd :call RSetWD()<CR>
" \rp print
nmap <silent> <Leader>rp :call RAction("print")<CR>
" \rn names
nmap <silent> <Leader>rn :call RAction("nvim.names")<CR>
" \rs summary
nmap <silent> <Leader>rd :call RAction("summary")<CR>
" \rv view dataframe
nmap <silent> <Leader>rv :call RAction("viewobj")<CR>

" \ro object browser
nmap <silent> <Leader>ro :call RObjBrowser()<CR>

" \rh help
nmap <silent> <Leader>rh :call RAction("help")<CR>
" \re example
nmap <silent> <Leader>re :call RAction("example")<CR>

" Send Line to R
nmap <silent> <S-l> :call SendLineToR("down")<CR>
vmap <silent> <Leader>rl <Plug>RDSendSelection
vmap <silent> <Leader>re <Plug>RESendSelection

" Use Ctrl+Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>

" AutoClose
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
