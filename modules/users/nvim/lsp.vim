" ------ COC ------{{{
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

 " Always show the signcolumn, otherwise it would shift the text each time
 " diagnostics appear/become resolved.
 if has("patch-8.1.1564")
   " Recently vim can merge signcolumn and number column into one
   set signcolumn=number
 else
   set signcolumn=yes
 endif

 " Use <CR> to confirm completion
 inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

  " Use <Tab> and <S-Tab> to navigate the completion list
  inoremap <expr> <Tab> pumvisible() ? "\<down>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<up>" : "\<S-Tab>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)


" Use <leader>cd to show documentation in preview window.
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction
nnoremap <silent> [code]d :call <SID>show_documentation()<CR>

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
xmap [code]F :Format<CR>
nmap [code]F :Format<CR>
" autocmd BufWritePre * Format

" Which-key mappings
let g:which_key_map.c = {
      \ 'name' : '+code' ,
      \ 'd' : 'code-documentation'          ,
      \ 'F' : [':Format'     , 'code-format']           ,
      \ 'f' : ['<Plug>(coc-format-selected)'     , 'code-format-selected']           ,
      \ 'a' : ['<Plug>(coc-codeaction)'     , 'code-action']           ,
      \ 'r' : ['<Plug>(coc-rename)'     , 'code-rename']           ,
      \ }

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)


  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" }}}

" vim: set foldmethod=marker:
