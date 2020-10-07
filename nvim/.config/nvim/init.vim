if 0 | endif

set exrc
set secure

filetype off

let mapleader =" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'dense-analysis/ale'
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug 'editorconfig/editorconfig-vim'
    Plug 'epheien/termdbg'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'jreybert/vimagit'
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'lyokha/vim-xkbswitch'
    Plug 'nvie/vim-flake8'
    Plug 'plytophogy/vim-virtualenv'
    Plug 'ptzz/lf.vim'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'takac/vim-hardtime'
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Some basics:
    set nocompatible

    set backup
    set backupdir=/tmp/vim/backup              " where to put backup files
    set directory=/tmp/vim/swap                " where to put swap files
    let g:SESSION_DIR='/tmp/vim/sessions'      " where to keep sessions

    if finddir(&backupdir) == ''
        silent call mkdir(&backupdir, "p")
    endif

    if finddir(&directory) == ''
        silent call mkdir(&directory, "p")
    endif

    if finddir(g:SESSION_DIR) == ''
        silent call mkdir(g:SESSION_DIR, "p")
    endif

    set mousehide
    set mouse=a
    set nohlsearch
    set clipboard+=unnamedplus
    set spelllang=en,ru
    set encoding=utf-8
    set number relativenumber
    set wrap linebreak nolist
    set textwidth=76
    set wrapmargin=76
    set colorcolumn=80
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on

" Enable bash-like autocompletion:
    set wildmode=longest,list,full

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
    map <leader>o :setlocal spell! spelllang=en_us,ru_ru<CR>

" Splits open at the bottom and right, which is non-retarded,
" unlike vim defaults.
    set splitbelow splitright

" Enable Hard Time Plugin
    let g:hardtime_default_on = 0

" Vim-Airline settings
    let g:airline_theme='simple'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    if has("gui_running")
        let g:airline_powerline_fonts = 1
    else
        let g:airline_powerline_fonts = 0
    endif

" To disable Python 2 support
    let g:loaded_python_provider = 0
" To disable Ruby support
    let g:loaded_ruby_provider = 0
" To disable Node JS support
    let g:loaded_node_provider = 0

" при выходе в коммандный режим, переключать язык на US
    let g:XkbSwitchEnabled = 1

" Deoplete plugin
    let g:deoplete#enable_at_startup = 1

" Vim-go plugin
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1
