" ------ LSPCONFIG ------{{{
 " TextEdit might fail if hidden is not set.
 set hidden

 " Some servers have issues with backup files, see #649.
 set nobackup
 set nowritebackup

 " Give more space for displaying messages.
 set cmdheight=2

 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
 " delays and poor user experience.
 set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=number

" Movement mappings
nmap [e :lua vim.diagnostic.goto_prev()<CR>
nmap ]e :lua vim.diagnostic.goto_next()<CR>
nmap gD :lua vim.lsp.buf.declaration()<CR>
nmap gd :lua vim.lsp.buf.definition()<CR>
nmap gi :lua vim.lsp.buf.implementation()<CR>


" Which-key mappings
nnoremap <leader>ce :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>cF :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>cr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>

let g:which_key_map.c = {
      \ 'name' : '+code' ,
      \ 'e' : 'code-errors',
      \ 'F' :    'code-format'           ,
      \ 'r' : 'code-rename'           ,
      \ 'a' :     'code-action'           ,
      \ }
"}}}

" vim: set foldmethod=marker:
