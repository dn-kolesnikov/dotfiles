if 0 | endif

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'fatih/molokai'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jreybert/vimagit'
    "Plug 'lyokha/vim-xkbswitch'
    Plug 'nvie/vim-flake8'
    Plug 'plytophogy/vim-virtualenv'
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'rootkiter/vim-hexedit'
    Plug 'rust-lang/rust.vim'
call plug#end()

" =============================================================================
" Some basics:
" =============================================================================
    set nocompatible
    set exrc
    set secure
    set mousehide
    set mouse=a
    set nohlsearch
    set clipboard+=unnamedplus
    set spelllang=en,ru
    set encoding=utf-8
    set number relativenumber
    set wrap linebreak nolist
    set textwidth=80
    set wrapmargin=80
    set colorcolumn=+1
    syntax on
    set t_Co=256
    set background=dark
    let g:molokai_original = 1
    let g:rehash256 = 1
    colorscheme molokai
    filetype plugin on
    filetype indent on

" Set command-line completion mode
    set wildmode=list:longest,full

    let mapleader =" "

" Spell-check set to <leader>o, 'o' for 'orthography':
    map <leader>o :setlocal spell! spelllang=en_us,ru_ru<CR>

" Splits open at the bottom and right, which is non-retarded,
" unlike vim defaults.
    set splitbelow splitright

    set backup
    set backupdir=/tmp/nvim/backup              " where to put backup files
    set directory=/tmp/nvim/swap                " where to put swap files
    let g:SESSION_DIR='/tmp/nvim/sessions'      " where to keep sessions

    if finddir(&backupdir) == ''
        silent call mkdir(&backupdir, "p")
    endif

    if finddir(&directory) == ''
        silent call mkdir(&directory, "p")
    endif

    if finddir(g:SESSION_DIR) == ''
        silent call mkdir(g:SESSION_DIR, "p")
    endif

" =============================================================================
" Netrw file browser
" =============================================================================
    let g:netrw_altv = 1
    let g:netrw_banner = 0
    let g:netrw_browse_split = 4
    let g:netrw_liststyle = 3
    let g:netrw_winsize = 25
 "   augroup ProjectDrawer
 "       autocmd!
 "       autocmd VimEnter * :Vexplore
 "   augroup END

" =============================================================================
" Nvim provider support
" =============================================================================
    " To disable Python 2 support
    let g:loaded_python_provider = 0
    " To disable Ruby support
    let g:loaded_ruby_provider = 0
    " To disable Node JS support
    let g:loaded_node_provider = 0

" =============================================================================
" Enable Hard Time Plugin
" =============================================================================
"    let g:hardtime_default_on = 0

" =============================================================================
" Vim-Airline settings
" =============================================================================
    let g:airline_theme='minimalist'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    if has("gui_running")
        let g:airline_powerline_fonts = 1
    else
        let g:airline_powerline_fonts = 0
    endif

" =============================================================================
" при выходе в коммандный режим, переключать язык на US
" =============================================================================
"    let g:XkbSwitchEnabled = 1

" =============================================================================
" Deoplete plugin
" =============================================================================
    let g:deoplete#enable_at_startup = 1
    " inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"

" =============================================================================
" Vim-go plugin
" =============================================================================
    let g:go_addtags_transform = "camelcase"
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1
    let g:go_echo_command_info = 0

