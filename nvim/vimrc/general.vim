
" Vim root
let g:rooter_resolve_links = 1
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = [
    \ '.root',
    \ '.git',
    \ '.git/'
    \ ]
" TODO: if .root file exists, source it

" Global search
let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 2000,
    \ 'use':        ['visual', 'hlsearch', 'last'] 
    \ }

call esearch#map('<leader>s', 'esearch')
call esearch#map('<leader>S', 'esearch-word-under-cursor')

" Comments
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

" Autocompletion
