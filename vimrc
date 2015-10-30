set nocompatible
filetype off                  " required

" ================= general ===============
set secure
set number
set backspace=2
set history=1000
set showcmd
set lazyredraw
set hidden
set background=dark
set colorcolumn=80
set mouse=a
set mousemodel=popup_setpos
syntax on
let mapleader=","

" ================ backups ================
if !isdirectory($HOME . '/.vim/.backup')
  call mkdir($HOME . '/.vim/.backup', 'p')
endif
set backupdir=~/.vim/.backup//

if !isdirectory($HOME . '/.vim/.swp')
  call mkdir($HOME . '/.vim/.swp', 'p')
endif
set directory=~/.vim/.swp//

if has('persistent_undo') && !isdirectory(expand('~').'/.vim/.undo')
  if !isdirectory($HOME . '/.vim/.undo')
    call mkdir($HOME . '/.vim/.undo', 'p')
  endif

  set undodir=~/.vim/.undo//
  set undofile
endif

" ============ indentation ================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
filetype plugin on
filetype indent on
" =========== trailing spaces ============
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

autocmd FileWritePre *.c,*.cpp,*.rb,*.java,*.py :call TrimWhiteSpace()
autocmd FileAppendPre *.c,*.cpp,*.rb,*.java,*.py :call TrimWhiteSpace()
autocmd FilterWritePre *.c,*.cpp,*.rb,*.java,*.py :call TrimWhiteSpace()
autocmd BufWritePre *.c,*.cpp,*.rb,*.java,*.py :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
" =============== search ==================
set incsearch
set ignorecase
set smartcase
set hlsearch

" =============== scroll ==================
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" =============== completion ==============
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/.backups*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-gitgutter'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-markdown'

Plugin 'junegunn/vim-easy-align'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'takac/vim-hardtime'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'jiangmiao/auto-pairs'

Plugin 'tpope/vim-endwise'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin s:indent changes, instead use:
"filetype plugin on

" ================ keybindings ==============
nmap <leader>T :enew<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nmap <leader>p <Plug>NERDTreeTabsToggle<CR>
nmap <leader>[ <Plug>NERDTreeFocusToggle<CR>
inoremap <silent><S-Tab> <C-o><<
inoremap <F3> <C-o>n
inoremap <S-F3> <C-o>N
noremap <Leader><CR> :nohlsearch<CR>

nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <<
noremap <right> >>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ================ plugin settings ============
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

colorscheme solarized
let g:solarized_contrast="high"

let g:hardtime_showmsg=1
let g:hardtime_maxcount=5
"autocmd BufEnter * HardTimeOn

autocmd Vimenter * IndentGuidesEnable

" ================== ycm settings ==============
" let g:ycm_error_symbol=">>"
" let g:ycm_warning_symbol="!!"
" let g:ycm_allow_changing_update_time=1
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_confirm_extra_conf=0
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" let g:ycm_collect_identifiers_from_tags_files=1
" autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

" ================= smoothscroll ============
noremap <silent> <c-u> :call smooth_scroll#up  (&scroll,   10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll,   10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up  (&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" ================== easymotion =============
map <Leader> <Plug>(easymotion-prefix)

" ================= nerdtree ================
let g:nerdtree_tabs_autoclose=1

" ================ easyalign ================
vmap <CR> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
