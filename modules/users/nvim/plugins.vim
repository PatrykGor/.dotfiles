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
      \ 'H' : [':set nosplitright | vsplit | VinegarTree'    , 'window-split-left']    ,
      \ 'J' : [':set splitbelow | split | VinegarTree'  , 'window-split-below']   ,
      \ 'K' : [':set nosplitbelow | split | VinegarTree'  , 'window-split-up']      ,
      \ 'L' : [':set splitright | vsplit | VinegarTree'    , 'window-split-right']   ,
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
      \ 'n' : [':tabedit % | VinegarTree', 'tab-new']           ,
      \ 'q' : [':tabclose', 'tab-close']           ,
      \ 'j' : ['gT', 'tab-previous']           ,
      \ 'k' : ['gt', 'tab-next']           ,
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

" ------ GITSIGNS ------ {{{
"Mappings
let g:which_key_map.g.h = {
      \ 'name' : '+hunk' ,
      \ 'p' : [':Gitsigns preview_hunk'     , 'git-hunk-preview']           ,
      \ 's' : [':Gitsigns stage_hunk'     , 'git-hunk-stage']          ,
      \ 'u' : [':Gitsigns undo_stage_hunk'     , 'git-hunk-undo']             ,
      \ 'b' : [':lua require"gitsigns".blame_line{full=true}'     , 'git-hunk-blame']             ,
      \ }
" }}}

" ------ GUTENTAGS ------ {{{
"Project root
let g:gutentags_project_root = ['^Projects', '.git'. '.root']
" }}}

" ------ TELESCOPE ------ {{{
"Bindings
"nnoremap : :Telescope commands<CR>

let g:which_key_map.f = {
      \ 'name' : '+find' ,
      \ 'f' : [':Telescope find_files', 'find-files']           ,
      \ 'b' : [':Telescope buffers', 'find-buffers']           ,
      \ 't' : [':Telescope live_grep', 'find-text']           ,
      \ 'g' : {
          \ 'name' : '+git' ,
          \ 'c' : [':Telescope git_bcommits', 'find-git-commits']           ,
          \ 'b' : [':Telescope git_branches', 'find-git-branches']           ,
      \ }
      \ }
" }}}

" ------ BUFFERLINE ------ {{{
let g:which_key_map.b = {
      \ 'name' : '+buffers' ,
      \ 'n' : [':enew', 'buffer-new']           ,
      \ 'q' : [':bd', 'buffer-close']           ,
      \ 'j' : [':BufferLineCyclePrev', 'buffer-previous']           ,
      \ 'k' : [':BufferLineCycleNext', 'buffer-next']           ,
      \ 'J' : [':BufferLineMovePrev', 'buffer-swap-previous']           ,
      \ 'K' : [':BufferLineMoveNext', 'buffer-swap-next']           ,
      \ '1' : [':BufferLineGoToBuffer 1', 'buffer-1']           ,
      \ '2' : [':BufferLineGoToBuffer 2', 'buffer-2']           ,
      \ '3' : [':BufferLineGoToBuffer 3', 'buffer-3']           ,
      \ '4' : [':BufferLineGoToBuffer 4', 'buffer-4']           ,
      \ '5' : [':BufferLineGoToBuffer 5', 'buffer-5']           ,
      \ '6' : [':BufferLineGoToBuffer 6', 'buffer-6']           ,
      \ '7' : [':BufferLineGoToBuffer 7', 'buffer-7']           ,
      \ '8' : [':BufferLineGoToBuffer 8', 'buffer-8']           ,
      \ '9' : [':BufferLineGoToBuffer 9', 'buffer-9']           ,
      \ }
" }}}

" ------ NVIMTREE ------ {{{
    command VinegarTree :lua require"nvim-tree".open_replacing_current_buffer()

    let g:which_key_map.e = 'explore'
    nnoremap <leader>e :VinegarTree<CR>
" }}}

" ------ UNDOTREE ------ {{{
    let g:which_key_map.u = 'undotree'
    nnoremap <leader>u :UndotreeToggle<CR>

    "Enable persistent undo
    if has("persistent_undo")
       let target_path = expand('~/.local/share/nvim/undofile')

        " create the directory and any parent directories
        " if the location does not exist.
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif

        let &undodir=target_path
        set undofile
    endif

    "Focus automatically on toggle
    let g:undotree_SetFocusWhenToggle = 1
" }}}

" ------ GITHUB COPILOT ------ {{{
"Bind <Tab> (already taken by LSP)
    let g:copilot_no_tab_map = v:true
    imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")

"Change next/prev bindings
    " imap <silent> <C-]> <Plug>(copilot-next)
    " imap <silent> <C-[> <Plug>(copilot-previous)
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
