" ------ BASIC SETTINGS ------ {{{
let mapleader=" "

" Some basic stuff
syntax on
set ignorecase
set smartcase
set number relativenumber
set termguicolors
set cursorline
set cursorcolumn
set autochdir

" Set colorscheme and use terminal background
" colorscheme __[vim_colorscheme_name]__
hi Normal guibg=NONE ctermbg=NONE

" Allow mouse
set mouse=a

" Remove auto-comment on newline (wtf vim?!)
autocmd BufEnter * set formatoptions-=c formatoptions-=r formatoptions-=o

" Using system clipboard
set clipboard+=unnamedplus

" Cleaning up viminfo
set viminfo+=n~/.vim/viminfo

" Get rid of trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Use syntax folding by default
" set foldmethod=syntax

" Neat indents
set expandtab autoindent tabstop=4 shiftwidth=4

" Autocompletion
set wildmode=longest,list,full
set completeopt=longest,menuone,preview
set previewheight=5

" Fix save and quit for autocmd
map ZZ :wq<CR>
" }}}

" ------ FILETYPE-SPECIFIC AUTOCMD ------{{{
" Set proper tabwidth for nix files
" autocmd BufEnter *.nix set shiftwidth=2

" Reload nixos configuration on edit
" autocmd BufWritePost /etc/nixos/* !sudo nixos-rebuild switch

" Make .sh files executable
autocmd BufWritePost *.sh silent! !chmod +x %

" Fix vim not seeing ms files as groff
autocmd BufEnter *.ms setfiletype groff

" Get this sweet sweet html completion...
autocmd BufEnter *.cshtml setfiletype html

" Synchronize WebDAV on modifications
autocmd BufWritePost /tmp/*.yml silent! !vdirsyncer sync
autocmd BufWritePost $XDG_DATA_HOME/calendar/reminders/*.rem !remind -s360 -irem2ics=1 $XDG_DATA_HOME/calendar/reminders | TZ=Poland rem2ics -do > $XDG_DATA_HOME/calendar/40192358-f3e4-4638-8ae4-95cff2a0f5f9/reminders.ics && vdirsyncer sync
"}}}

" ------ SAVED MACROS ------{{{
    " For converting TOS to Html
    let @d = '/^ *\d\. €kb€kb€kb\d\?\. df.V/^ *\d\d\?\. \|<\.€kb.€kb/ol>kS<li'
    let @a = '/^ *[a0€kb-z]\. df.V/ €kb^ *[a-z]\. |€kb\|<\/ol>kS<li'
"}}}

" ------ 'VANILLA' BINDINGS ------{{{
" Simpler movement
noremap j gj
noremap k gk

noremap H ^
noremap J <C-d>
noremap K <C-u>
noremap L $

" Search and replace
function! SearchAndReplace(pattern, replacement)
    execute '%s/' . a:pattern . '/' . a:replacement . '/gc'
endfunction
command! -nargs=* Sar call SearchAndReplace(<f-args>)

" Insert screenshots into groff documents
command! -nargs=1 Screenshot execute '!import $HOME/Pictures/screenshots/documents/<args>.eps' <bar> :normal o.PSPIC -<++> /home/patryk/Pictures/screenshots/documents/<args>.eps -<++>i -<++>i<esc>0

" Clear highlighting
map <silent> <esc> :noh<cr>

" Some common sense saving commands
map ZS :w<CR>
map ZR :w !sudo tee %<CR>

" Placeholders (with <++>)
noremap <C-j> <Esc>/<++><CR><Esc>cf>
inoremap <C-j> <Esc>/<++><CR><Esc>cf>
"}}}

" ------ FUNCTIONS AND COMMANDS ------{{{
" Search and replace
function! SearchAndReplace(pattern, replacement)
    execute '%s/' . a:pattern . '/' . a:replacement . '/gc'
endfunction
command! -nargs=* Sar call SearchAndReplace(<f-args>)

" Insert screenshots into groff documents
command! -nargs=1 Screenshot execute '!import $HOME/Pictures/screenshots/documents/<args>.eps' <bar> :normal o.PSPIC -<++> /home/patryk/Pictures/screenshots/documents/<args>.eps -<++>i -<++>i<esc>0
"}}}

" vim: set foldmethod=marker:
