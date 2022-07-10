" setlocal shiftwidth=2 
" setlocal softtabstop=2 

nmap <silent> <leader>rs <Plug>(vimtex-compile)

nmap <silent> <leader>ri <plug>(vimtex-info)
nmap <silent> <leader>rI <plug>(vimtex-info-full)
nmap <silent> <leader>rt <plug>(vimtex-toc-open)
nmap <silent> <leader>rT <plug>(vimtex-toc-toggle)
nmap <silent> <leader>rq <plug>(vimtex-log)
nmap <silent> <leader>rv <plug>(vimtex-view)
nmap <silent> <leader>rr <plug>(vimtex-reverse-search)
nmap <silent> <leader>rL <plug>(vimtex-compile-selected)
xmap <silent> <leader>rL <plug>(vimtex-compile-selected)
nmap <silent> <leader>rk <plug>(vimtex-stop)
nmap <silent> <leader>rK <plug>(vimtex-stop-all)
nmap <silent> <leader>re <plug>(vimtex-errors)
nmap <silent> <leader>ro <plug>(vimtex-compile-output)
nmap <silent> <leader>rg <plug>(vimtex-status)
nmap <silent> <leader>rG <plug>(vimtex-status-all)
nmap <silent> <leader>rc <plug>(vimtex-clean)
nmap <silent> <leader>rC <plug>(vimtex-clean-full)
nmap <silent> <leader>rm <plug>(vimtex-imaps-list)
nmap <silent> <leader>rx <plug>(vimtex-reload)
nmap <silent> <leader>rX <plug>(vimtex-reload-state)
nmap <silent> <leader>ra <plug>(vimtex-context-menu)