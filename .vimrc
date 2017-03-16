""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Borrow from https://github.com/Junichilto/dotfiles.git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set vim default setting
set nocompatible

" Tempolary turn off file type checking
filetype off

""""""""""""""""""""""
" Plugin settings    "
""""""""""""""""""""""
if has('vim_starting')
  set nocompatible  " Be iMprobed
  
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Useful setting for opening file
NeoBundle 'Shougo/unite.vim'

" Display files which is used Unite.vim
NeoBundle 'Shougo/neomru.vim'

" Display tree structure of files
NeoBundle 'scrooloose/nerdtree'

" Syntax high-ligting for Scala file.
NeoBundle 'derekwyatt/vim-scala'

" Syntax high-ligting for julia file.
NeoBundle 'JuliaLang/julia-vim'

" Helpful plugins for commenting
NeoBundle 'tomtom/tcomment_vim'

" Exchange single quoatation and double quoatations, etc.
NeoBundle 'tpope/vim-surround'

" Coloring indent
NeoBundle 'nathanaeIkane/vim-indent-guides'

" Coloring log files
NeoBundle 'vim-scripts/AnsiEsc.vim'

" Visualize half-width space at end of line
NeoBundle 'bronson/vim-trailing-whitespace'

" Syntax high-lighting for `less`
NeoBundle 'KohPoll/vim-less'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup.
" this will conveniently prompt you to install them.
NeoBundleCheck
"""""""""""""""""""""""""""""""

""""""""""""""
" Options
""""""""""""""
" Designate a tag file
set tags=~/.tags
" Disable swap file
set noswapfile
" Display current cursor position
set ruler
" Number of lines for command line
set cmdheight=2
" Display status line constantly
set laststatus=2
" Define display style of status line
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" Display title bar
set title
" Enable filename completion by tab on command line mode
set wildmenu
" Display command on input
set showcmd
" Backup directory
set backupdir=$HOME/.vimbackup
" Buffer file for exploring
set browsedir=buffer
" Ignore case distinctions in searching
set smartcase
" Highlighting
set hlsearch
" Dark back color
set background=dark
" Exchange tab to mixture of space
set expandtab
" Enable incremental search
set incsearch
" Visualize invisible character
set list
" Visualize tab and line continous
set listchars=tab:>\ ,extends:<
" Display line number
set number
" Diplay corresponding braket
set showmatch
" Inherit indent previous line
set autoindent
" Automaticaly indent
set smartindent
" Disable stopping cursor at head or end of line
set whichwrap=b,s,h,l,<,>,[,]
" Enable syntax coloring
syntax on
" Designate colorschema
colorscheme desert
" Color of line number
highlight LineNr ctermfg=darkeyellow
""""""""""""""""""""""""""""""""""""

" Emable vim-indent-guides on vim startup
let g:indent_guides_enable_on_vim_startup = 1

" Display QueickFix List after running grep search
autocmd QuickFixCmdPost *grep* cwindow

"""""""""""""""""""""""
" Setting for Unit.vim
"""""""""""""""""""""""
" Ref.: http://blog.remora.cx/2010/12/vim-ref-with-unite.html
"
" Enable insert mode on startup
let g:unite_enable_start_insert = 1
" List of buffers
noremap <C-P> :Unite buffer<CR>
" List of files
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :utf :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

function! ZenkakuSpace()
	ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace','　')
	augroup END
	call ZenkakuSpace()
endif

let g:hi_insert = 'highlight Statusline guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

set history=2000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autochdir
set laststatus=4
set smartindent
