" ******************************************************** "
" **********************  Plugin  ************************ "
" ******************************************************** "

" Pack availables: ['web', 'js', 'go', 'python', 'md', 'scala', 'latex', 'haskell']

let s:packs_enabled=["", "python", "web", "haskell", "go"]

" ******************************************************** "
" ******************************************************** "
" ******************************************************** "

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'

" ******************************************************** "
" **********************   BASE   ************************ "
" ******************************************************** "

" Beautify the window
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Git aliases in vim
Plugin 'tpope/vim-fugitive'

" Completion for main languages
Plugin 'Valloric/YouCompleteMe'

" Editorconfig formatting
Plugin 'editorconfig/editorconfig-vim'

" Basic colorschemes
Plugin 'flazz/vim-colorschemes'

" Get the list of definitions (classes, functions, variables
Plugin 'majutsushi/tagbar'

" Syntax checking
Plugin 'w0rp/ale'

let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on

" Super - formatter
Plugin 'Chiel92/vim-autoformat'
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Polyglot
Plugin 'sheerun/vim-polyglot'

" Manage FS in vim
Plugin 'scrooloose/nerdtree'

" Tab /= align all =
Plugin 'godlygeek/tabular'
if exists(":Tabularize")
    nmap <Leader>t= :Tabularize /=<CR>
    vmap <Leader>t= :Tabularize /=<CR>
    nmap <Leader>t: :Tabularize /:\zs<CR>
    vmap <Leader>t: :Tabularize /:\zs<CR>
endif

"comment lines
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" ******************************************************** "
" ******************************************************** "
" ******************************************************** "

" Web
if (index(s:packs_enabled, "web") != -1)
    Plugin 'groenewege/vim-less'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'othree/html5.vim'
    Plugin 'gregsexton/MatchTag'
endif

" Javascript
if (index(s:packs_enabled, "js") != -1)
    Plugin 'moll/vim-node'
    Plugin 'pangloss/vim-javascript'
    Plugin 'ElyKar/vim-jsdoc'

    let g:jsdoc_access_descriptions=1
    let g:jsdoc_underscore_private=1
    let g:jsdoc_tags = {
          \   'returns':   'return',
          \   'function':  'function',
          \   'param':     'param',
          \   'class':     'class'
          \ }
    let g:jsdoc_enable_es6=1
endif

" Golang
if (index(s:packs_enabled, "go") != -1)
    Plugin 'fatih/vim-go'
    let g:go_fmt_command = "goimports"

    " turn highlighting on
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    " Open go doc in vertical window, horizontal, or tab
    au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
    au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
    au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
endif

 "Python
if (index(s:packs_enabled, "python") != -1)
    Plugin 'davidhalter/jedi-vim'
    Plugin 'nvie/vim-flake8'
    Plugin 'python-mode/python-mode'
endif

" Markdown editor
if (index(s:packs_enabled, "md") != -1)
    Plugin 'suan/vim-instant-markdown'
endif

" Scala
if (index(s:packs_enabled, "scala") != -1)
    Plugin 'derekwyatt/vim-scala'
endif

" Latex
if (index(s:packs_enabled, "latex") != -1)
    Plugin 'LaTeX-Box-Team/LaTeX-Box'
endif

" Haskell
if (index(s:packs_enabled, "haskell") != -1)
    Plugin 'Shougo/vimproc.vim' " dependency
    Plugin 'eagletmt/neco-ghc'
    Plugin 'eagletmt/ghcmod-vim'
    Plugin 'dag/vim2hs'
    let g:haskellmode_completion_ghc = 0
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    let g:ycm_semantic_triggers = {'haskell' : ['.']}
endif

call vundle#end()

syntax on
colorscheme vividchalk

" ******************************************************** "
" **********************   BASE   ************************ "
" ******************************************************** "

set number       " line number
set autoindent
set smartindent

set scrolljump=4 " lines to scroll when cursor leaves screen
set scrolloff=5  " minimum lines to keep above and below cursor

set history=1000

" ******************************************************** "
" ******************************************************** "
" ******************************************************** "

" The current buffer can be put to the background without writing to disk;
" When a background buffer becomes current again, marks and undo-history are remembered.
set hidden

nnoremap ' `
nnoremap ` '

set title
set shortmess=atI
"deal with tabs : http://tedlogan.com/techblog3.html
set tabstop=4           " Tabs are 4 spaces
set shiftwidth=4        " 4 spaces for indent
set expandtab           " Spaces instead of tabs

"set foldenable          " auto fold code
set gdefault            " the /g flag on ðŸ˜–
"substitutions by default
set encoding=utf-8
set fileencodings=utf-8

" <Leader> key binding
let mapleader=","

" Useful mappings for managing tabs
map <Leader>tn :tabnew<CR>
map <Leader>to :tabonly<CR>
map <Leader>tc :tabclose<CR>
map <Leader>tm :tabmove
map <Leader>t<Leader> :tabnext

" ******************************************************** "
" **********************  SEARCH   *********************** "
" ******************************************************** "

set incsearch           " find as you type search
set ignorecase          " case insensitive search
set smartcase           " case sensitive when uc present

" ******************************************************** "
" ******************************************************** "
" ******************************************************** "

nmap <F8> :source $MYVIMRC<ENTER>
nmap <F9> :JsDoc <ENTER>

set pastetoggle=<F3>

" Manage splits
set splitbelow
set splitright

" Activate autcompletion
filetype on
filetype indent on   "Automatically detect file types.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType less set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType go set omnifunc=gocomplete#CompleteGo
autocmd FileType c set omnifunc=ccomplete#Complete

" Swap files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()

" For learning to move with hjkl
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
noremap <Left> <nop>
