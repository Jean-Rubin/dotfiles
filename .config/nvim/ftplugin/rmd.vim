source ~/.config/nvim/ftplugin/r.vim

" Chunk in Rmd
nmap <silent> <Leader>cd :call b:SendChunkToR("silent", "down")<CR>
nmap <silent> <Leader>cc :call b:SendChunkToR("silent", "stay")<CR>

" Knit
nmap <silent> <Leader>kn :call RKnit()<CR>
nmap <silent> <Leader>kh :call RMakeRmd("html_document")<CR>
nmap <silent> <Leader>kp :call RMakeRmd("pdf_document")<CR>
