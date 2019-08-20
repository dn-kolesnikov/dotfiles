set exrc
set secure

filetype off

let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'SirVer/ultisnips'
    Plug 'davidhalter/jedi-vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'honza/vim-snippets'
    Plug 'jreybert/vimagit'
    Plug 'kien/ctrlp.vim'
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'mitsuhiko/vim-jinja'
    Plug 'plytophogy/vim-virtualenv'
    Plug 'python-mode/python-mode'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'vifm/vifm.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'xavierd/clang_complete'
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
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on

" Enable autocompletion:
    set wildmode=longest,list,full

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
    map <leader>o :setlocal spell! spelllang=en_us,ru_ru<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set splitbelow splitright

" Nerd tree
    map <leader>n :NERDTreeToggle<CR>
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Python-mode settings
    let g:pymode_options = 0
    let g:pymode_lint_write = 0
    let g:pymode_folding = 0
    let g:pymode_rope = 0
    let g:pymode_rope_autoimport = 0
    let g:pymode_rope_vim_completion = 0
    let g:pymode_python = 'python3'

" Vim-Airline settings
    let g:airline_theme='simple'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    if has("gui_running")
        let g:airline_powerline_fonts = 1
    else
        let g:airline_powerline_fonts = 0
    endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

" Clang-completer
" Включить дополнительные подсказки (аргументы функций, шаблонов и т.д.)
    let g:clang_snippets=1
" Использоать ultisnips для дополнительных подскахок (чтобы подсказки шаблонов
" автогенерации были в выпадающих меню)
    let g:clang_snippets_engine = 'ultisnips'
" Периодически проверять проект на ошибки
    let g:clang_periodic_quickfix=1
" Подсвечивать ошибки
    let g:clang_hl_errors=1
" Автоматически закрывать окно подсказок после выбора подсказки
    let g:clang_close_preview=1
" По нажатию Ctrl+F проверить поект на ошибки
    map <c-f> :call g:ClangUpdateQuickFix()<cr>

" Run xrdb whenever Xdefaults or Xresources are updated.
    autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

