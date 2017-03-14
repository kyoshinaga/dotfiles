set number
set hlsearch
set history=2000
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set autochdir
set laststatus=2
set smartindent

if 0 | endif

set runtimepath^=~/.vim/bundle/neobundle.vim

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'JuliaLang/julia-vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
