set encoding=utf-8
set fileencoding=utf-8
set termguicolors

set t_Co=256

"Plugin management stuff 
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

"Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
Plugin 'vim-jp/vim-cpp'
Plugin 'Konfekt/FastFold'
"Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'SirVer/ultisnips'
Plugin 'arakashic/chromatica.nvim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'

Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'jeaye/color_coded'
Plugin 'sudar/comments.vim'
"Plugin 'rhysd/vim-clang-format'
"Plugin 'lyuts/vim-rtags'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'tikhomirov/vim-glsl'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

"Plugin 'spolu/dwm.vim'
Plugin 'terryma/vim-multiple-cursors'

" My own plugins
"Plugin 'jmnel/vim-konsole'

" Colorscheme plugins
Plugin 'w0ng/vim-hybrid'
Plugin 'arcticicestudio/nord-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'wombat256.vim'
Plugin 'ajh17/spacegray.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'marcelbeumer/spacedust.vim'
"Plugin 'jmnel/Zenburn'

" After all plugins...
call vundle#end()

call glaive#Install()

Glaive codefmt plugin[mappings]
Glaive codefmt clang_format_style='file'

filetype plugin indent on

"let g:pyton_host_prog = '/usr/bin/nvim/

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <A-f> : YcmCompleter FixIt<CR>

" *** Deoplete settings ***
"let g:deoplete#enable_at_startup = 1

" *** Chromatica settings ***
let g:chromatica#enable_at_startup=1
let g:chromatica#highlight_feature_level=1
let g:chromatica#responsive_mode=1

let g:doxygen_enhanced_color=0
"let g:load_doxygen_syntax=1

"let g:ycm_key_list_select_compliation = [ '<C-n>', '<Down>' ]
"let g:ycm_key_list_previous_compilation = [ '<C-p>', '<Up>' ]
"let g:SuperTabDefaultCompletionType = '<C-n>'

"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabCrMapping = 0
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:ycm_key_list_select_compliation = [ '<C-j>', '<C-n>', '<Down>' ]
"let g:ycm_key_list_previous_compilation = [ '<C-k>', '<C-p>', '<Up>' ]

"let g:clang_format#code_style = 'google'
"let g:clang_format#auto_format_on_insert_leave = 1
"let g:clang_format#style_options = {
    "\ "IndentWidth" : 4,
    "\ "AccessModifierOffset" : -4,
    "\ "AllowShortFunctionsOnASingleLine" : "false",
    "\ "BinPackArguments" : "false",
    "\ "BinPackParameters" : "false",
    "\ "NamespaceIndentation" : "All",
    "\ "SortIncludes" : "false" }

function! s:safeundo()
    let s:pos = getpos('.')
    let s:view = winsaveview()
    undo
    call setpos( '.', s:pos )
    call winrestview( s:view )
endfunc

function! s:saferedo()
    let s:pos = getpos('.')
    let s:view = winsaveview()
    redo
    call setpos( '.', s:pos )
    call winrestview( s:view )
endfunc

command SafeUndo call s:safeundo()
command SafeRedo call s:saferedo()

nnoremap u : SafeUndo <CR>
nnoremap <C-r> : SafeRedo <CR>

"command! -nargs=0 SudoW w !sudo tee % > /dev/null

" *** General coding stuff ***

set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
""set foldclose=all
let g:cpp_fold = 1

"hi Normal ctermbg=NONE

" Fix backspace indent
set backspace=indent,eol,start
" Highlight column 80
set colorcolumn=100
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
set nowrap

"hi Normal guibg=NONE ctermbg=NONE
" Disable mouse click to go to position
"set mouse-=a
" Don't let autocomplete affect usual typing habits
"set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" *** Python stuff ***
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all=1

" *** Keybindings ***

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set smartcase

set shell=/bin/zsh

let g:indentLine_enabled=1
let g:indentLine_concealCursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

set background=dark
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark="hard"

colorscheme dracula

set termguicolors

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/build/*/CMakeFiles/*
set wildignore+=*/build/CMakeFiles/*
set wildignore+=*/build/Makefile
set wildignore+=*/build/*/Makefile
set wildignore+=*/docs/html/*

" Improved key mappings
"nnoremap <SPACE> <Nop>
"let mapleader = ' '
map <SPACE> <leader>

"imap fj <esc>
"imap jf <esc>
"nnoremap ; :
"nnoremap : ;
noremap <Up> <C-W>k
noremap <Down> <C-W>j
noremap <Left> <C-W>h
noremap <Right> <C-W>l

nmap <tab> gt
nmap <s-tab> gT

let g:tex_flavor='latex'
let g:tex_conceal=''
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'xelatex'

autocmd BufNewFile,BufRead *.inl set syntax=cpp

" Google codefmt plugin automatic settings
augroup autoformat_settings
    autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

" Load my own custom vim scripts here. These will eventually be turned into plugins.
source ~/repos/vim-scripts/CppHeaderToggle.vim

autocmd BufNewFile,BufRead *.json set conceallevel=0

highlight LineNr ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey gui=NONE
