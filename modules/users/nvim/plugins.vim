" ------ WHICH KEY VANILLA ------ {{{
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}

" Align keybinds to the left
let g:which_key_centered = 0

" Hide statusline
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Split navigation (ignore vimwiki default bindings)
let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'h' : ['<C-w>h'     , 'window-left']           ,
      \ 'j' : ['<C-w>j'     , 'window-below']          ,
      \ 'k' : ['<C-w>k'     , 'window-up']             ,
      \ 'l' : ['<C-w>l'     , 'window-right']          ,
      \ 'H' : [':set nosplitright | vsplit'    , 'window-split-left']    ,
      \ 'J' : [':set splitbelow | split'  , 'window-split-below']   ,
      \ 'K' : [':set nosplitbelow | split'  , 'window-split-up']      ,
      \ 'L' : [':set splitright | vsplit'    , 'window-split-right']   ,
      \ 'q' : ['<C-w>q'    , 'window-close']   ,
      \ 'i' : 'which_key_ignore'   ,
      \ 's' : 'which_key_ignore'   ,
      \ 't' : 'which_key_ignore'   ,
      \ 'w' : 'which_key_ignore'   ,
      \ }

" File operations
nnoremap <leader>Fn :!touch<Space>
nnoremap <leader>Fd :!rm<Space>%
nnoremap <leader>Fm :!mv<Space>%<Space>
let g:which_key_map.F = {
      \ 'name' : '+files' ,
      \ 'n' : 'file-new'           ,
      \ 'd' : 'file-delete'          ,
      \ 'm' : 'file-move'             ,
      \ }


" Utilities
nnoremap <leader>dr :Sar<space>
xnoremap <leader>dr :s///g
nnoremap <leader>ds :Screenshot<Space>
nnoremap <leader>dc :!\rm $HOME/Pictures/screenshots/documents/*
let g:which_key_map.d = {
      \ 'name' : '+document' ,
      \ 'r' : 'document-replace'           ,
      \ 's' : 'document-screenshot-insert'             ,
      \ 'c' : 'document-clear-screenshots'             ,
      \ }


" Move between tabs
let g:which_key_map.t = {
      \ 'name' : '+tabs' ,
      \ 'J' : ['gT', 'tab-previous']           ,
      \ 'K' : ['gt', 'tab-next']           ,
      \ 'q' : [':tabclose', 'tab-close']           ,
      \ '1' : ['1gt', 'tab-1']           ,
      \ '2' : ['2gt', 'tab-2']           ,
      \ '3' : ['3gt', 'tab-3']           ,
      \ '4' : ['4gt', 'tab-4']           ,
      \ '5' : ['5gt', 'tab-5']           ,
      \ '6' : ['6gt', 'tab-6']           ,
      \ '7' : ['7gt', 'tab-7']           ,
      \ '8' : ['8gt', 'tab-8']           ,
      \ '9' : ['9gt', 'tab-9']           ,
      \ '0' : [':tablast', 'tab-last']           ,
      \ }

" Spell check
let g:which_key_map.s = {
      \ 'name' : '+spellcheck' ,
      \ 'e' : [':setlocal spell spelllang=en_us', 'spell-english']           ,
      \ 'b' : [':setlocal spell spelllang=en_gb', 'spell-british']           ,
      \ 'g' : [':setlocal spell spelllang=de', 'spell-german']           ,
      \ 'p' : [':setlocal spell spelllang=pl', 'spell-polish']           ,
      \ 'q' : [':setlocal nospell', 'spell-stop']           ,
      \ }
" }}}

" ------ VIMWIKI ------ {{{
"Options (markdown as syntax)
let g:vimwiki_list = [{
	\ 'path': '~/Notes',
	\ 'template_path': '~/Notes/templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '/mnt/gorscy/var/www/wiki/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.tpl'}]

"Mappings
nmap <leader>nc <Plug>Vimwiki2HTML
nmap <leader>nt <Plug>Vimwiki2HTMLBrowse
nmap <leader>nu <Plug>VimwikiDiaryGenerateLinks
nmap <leader>ng <Plug>VimwikiGoto
nmap <leader>nd <Plug>VimwikiDeleteFile
nmap <leader>nr <Plug>VimwikiRenameFile
let g:which_key_map.n = {
      \ 'name' : '+notes' ,
      \ 'c' : 'notes-convert-html'           ,
      \ 't' : 'notes-test-html'          ,
      \ 'u' : 'notes-update-diary'             ,
      \ 'g' : 'notes-goto'          ,
      \ 'd' :  'notes-delete'    ,
      \ 'r' :  'notes-rename'   ,
      \ }
" }}}

" ------ VIMFUGITIVE ------ {{{
"Mappings
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':Git'     , 'git-status']             ,
      \ 'a' : [':Git add %'     , 'git-add']          ,
      \ 'r' : [':Git rm %'     , 'git-remove']          ,
      \ 'c' : [':Git commit'     , 'git-commit']          ,
      \ 'm' : [':Gvdiffsplit'     , 'git-merge']             ,
      \ }
" }}}

" ------ GITGUTTER ------ {{{
"Mappings
let g:which_key_map.g.h = {
      \ 'name' : '+hunk' ,
      \ 'p' : ['<Plug>(GitGutterPreviewHunk)'     , 'hunk-preview']           ,
      \ 's' : ['<Plug>(GitGutterStageHunk)'     , 'hunk-stage']          ,
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'     , 'hunk-undo']             ,
      \ }
" }}}

" ------ ROOTER ------ {{{
"Project patterns
let g:rooter_patterns = ['^Projects', '.git'. '.root']

"Change to file directory for non-project files
let g:rooter_change_directory_for_non_project_files = 'current'
" }}}

" ------ GUTENTAGS ------ {{{
"Project root
let g:gutentags_project_root = ['^Projects', '.git'. '.root']
" }}}

" ------ LF.VIM ------ {{{
"Don't map key by default
let g:lf_map_keys = 0

"Replace netrw
let g:lf_replace_netrw = 1

"Make window full-screen
let g:lf_width = 1.0
let g:lf_height = 1.0

"Mappings
let g:which_key_map.t.n = [ ':LfWorkingDirectoryExistingOrNewTab', 'tab-new' ]
" }}}

" ------ TELESCOPE ------ {{{
"Bindings
let g:which_key_map.f = {
      \ 'name' : '+find' ,
      \ 'f' : [':Telescope find_files', 'find-files']           ,
      \ 'b' : [':Telescope buffers', 'find-buffers']           ,
      \ 'c' : {
          \ 'name' : '+code' ,
          \ 't' : [':Telescope tags', 'find-tags']           ,
          \ 'r' : [':Telescope lsp_references', 'code-references']           ,
          \ 'c' : [':Telescope cheat fd', 'code-cheatsheet']           ,
          \ 'd' : [':Telescope diagnostics', 'code-diagnostics']           ,
      \ }           ,
      \ 'g' : {
          \ 'name' : '+git' ,
          \ 'c' : [':Telescope git_bcommits', 'git-commits']           ,
          \ 'b' : [':Telescope git_branches', 'git-branches']           ,
      \ }
      \ }
" }}}

" ------ GITHUB COPILOT ------ {{{
"Bind <Tab> (already taken by LSP)
    let g:copilot_no_tab_map = v:true
    imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")

"Change next/prev bindings
    imap <silent> <C-]> <Plug>(copilot-next)
    imap <silent> <C-[> <Plug>(copilot-previous)
"}}}

" ------ COLOR SCHEME ------ {{{
"Theme settings
let g:nord_contrast = v:true
let g:nord_borders = v:true
let g:nord_disable_background = v:true
let g:nord_enable_sidebar_background = v:true

"Set theme
colorscheme nord
" }}}

" vim: set foldmethod=marker:
