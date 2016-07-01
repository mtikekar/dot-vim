let g:ipy_perform_mappings=0
map  <buffer> <silent> <c-cr> :py run_this_line()<cr>
imap <buffer> <silent> <c-cr> <C-o>:py run_this_line()<cr>
xmap <buffer> <silent> <c-cr> :py run_these_lines()<cr>
map  <buffer> <silent> <c-s> :py show_cword()<cr>

command! -buffer IPy call SuperTabSetCompletionType('<c-x><c-u>') | IPython
