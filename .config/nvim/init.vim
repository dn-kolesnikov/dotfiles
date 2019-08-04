filetype off
let mapleader =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'davidhalter/jedi-vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jreybert/vimagit'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'mitsuhiko/vim-jinja'
  Plug 'python-mode/python-mode'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vifm/vifm.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Some basics:
  set nocompatible
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
  let g:pymode_rope_vim_completion = 0

" Vim-Airline settings
  let g:airline_theme='simple'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
  if has("gui_running")
    let g:airline_powerline_fonts = 1
  else
    let g:airline_powerline_fonts = 0
  endif

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

