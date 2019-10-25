autocmd!

set encoding=UTF-8
set fileencoding=UTF-8
set termguicolors

set t_Co=256

"Plugin management stuff 
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

"Plugin 'LaTeX-Box-Team/LaTeX-Box'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'
Plugin 'vim-jp/vim-cpp'
Plugin 'Konfekt/FastFold'
"Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'neoclide/coc.nvim'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'arakashic/chromatica.nvim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
"Plugin 'Yggdroot/indentLine'

Plugin 'pboettch/vim-cmake-syntax'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'jeaye/color_coded'
Plugin 'sudar/comments.vim'
Plugin 'vim-scripts/toggle_comment'
"Plugin 'rhysd/vim-clang-format'
"Plugin 'lyuts/vim-rtags'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'sakhnik/nvim-gdb'
"Plugin 'ncm2/float-preview.nvim'
"Plugin 'Shougo/defx.nvim'
Plugin 'tikhomirov/vim-glsl'
"Plugin 'lervag/vimtex'
"Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'spolu/dwm.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'
Plugin 'vim-syntastic/syntastic'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'cespare/vim-toml'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'zxqfl/tabnine-vim'

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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'marcelbeumer/spacedust.vim'
Plugin 'jmnel/oceanic-next'
"Plugin 'challenger-deep-theme/vim'
Plugin 'fenetikm/falcon'
"Plugin 'jmnel/Zenburn'

" After all plugins...
call vundle#end()

call glaive#Install()

Glaive codefmt plugin[mappings]
Glaive codefmt clang_format_style='file'

filetype plugin indent on

" vim airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

"let g:pyton_host_prog = '/usr/bin/nvim/

"  ----------------------
"  YouCompleteMe Settings
"  ----------------------
"let g:ycm_use_clangd=1
"let g:ycm_clangd_uses_ycmd_caching=0
"let g:ycm_clangd_binary_path=exepath("clangd")
"let g:ycm_clangd_args=['-background-index', '-pretty', '-color']
"let g:ycm_complete_in_comments=1
"let g:ycm_confirm_extra_conf=0
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_cache_omnifunc=0
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_rust_src_path = '/home/jacques/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
"let g:ycm_warning_symbol = ' '
"let g:ycm_error_symbol = ' '
"let g:syntastic_warning_symbol = ' '
"let g:syntastic_error_symbol = ' '
"nnoremap <A-f> : YcmCompleter FixIt<CR>
"nnoremap <leader>gy : YcmCompleter GoTo<CR>

"command! ConfReload so ~/.config/nvim/init.vim

"!command ConfEdit e ~/.config/nvim/init.vim

" Enable word wrap in QuickFix and Location List windows.
augroup FooBar
    autocmd!
    autocmd FileType qf setlocal wrap
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd BufEnter,WinEnter term://* startinsert
"    autocmd Enter
augroup END

" Rust settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_eq=0

"let g:deoplete#enable_at_startup=1
"let g:racer_experimental_completer=1
set hidden

" settings for coc nvim
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c


let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
   Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
 Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"let g:racer_experimental_completer=1

"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap <leader>gd <Plug>(rust-doc)

"let g:rustfmt_autosave=1

" *** Chromatica settings ***
"let g:chromatica#enable_at_startup=1
"let g:chromatica#highlight_feature_level=1
"let g:chromatica#responsive_mode=1

"let g:doxygen_enhanced_color=0
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


" LaTeX stuff
let g:tex_flavor='latex'
let g:tex_conceal=''
"let g:livepreview_previewer = ''
"let g:livepreview_engine = 'xelatex'



" *** General coding stuff ***

" Code folding
"set foldmethod=syntax
"set foldlevel=1
"set foldnestmax=2
""set foldclose=all
"let g:cpp_fold = 1

hi Normal ctermbg=NONE

" Fix backspace indent
set backspace=indent,eol,start
" Highlight column 80
set colorcolumn=101
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


set background=dark
"let g:gruvbox_contrast_light="hard"
"let g:gruvbox_italic=1
"let g:gruvbox_invert_signs=0
"let g:gruvbox_improved_strings=0
"let g:gruvbox_improved_warnings=1
"let g:gruvbox_undercurl=1
"let g:gruvbox_contrast_dark="hard"

"highlight SignColumn ctermbg=none

au ColorScheme * hi Normal ctermbg=NONE guibg=NONE
"au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
au ColorScheme * hi EndOfBuffer ctermbg=NONE guibg=NONE
au ColorScheme * hi LineNr ctermbg=NONE guibg=NONE
au ColorScheme * hi NonText  ctermbg=NONE guibg=NONE
au ColorScheme * hi SignColumn ctermbg=NONE guibg=NONE
au ColorScheme * hi GitGutterAdd ctermbg=NONE guibg=NONE
au ColorScheme * hi GitGutterChange ctermbg=NONE guibg=NONE
au ColorScheme * hi GitGutterDelete ctermbg=NONE guibg=NONE
au ColorScheme * hi GitGutterChangeDelete ctermbg=NONE guibg=NONE

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic =1
colorscheme OceanicNext

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
noremap H ^
noremap L $
noremap ^ H
noremap $ L

tnoremap <Esc> <C-\><C-n>
tnoremap <Up> <C-\><C-N><C-w>k
tnoremap <Down> <C-\><C-N><C-w>j
tnoremap <Left> <C-\><C-N><C-w>h
tnoremap <Right> <C-\><C-N><C-w>l

"nmap <tab> gt
"nmap <s-tab> gT

nmap <tab> :bnext<CR>
nmap <s-tab> :bprevious<CR>

" ----------------------
" NERD Settings
nnoremap <silent> <C-B> :NERDTreeToggle<CR>
augroup NerdAutoGroup
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

autocmd BufNewFile,BufRead *.inl set syntax=cpp

" Google codefmt plugin automatic settings
augroup autoformat_settings
    autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

" Load my own custom vim scripts here. These will eventually be turned into plugins.
source ~/repos/jmnel/vim-scripts/CppHeaderToggle.vim

autocmd BufNewFile,BufRead *.json set conceallevel=0

"inoremap <silent><expr> <TAB> pumvisible() ? '<C-n>' : '<TAB>'
"inoremap <silent><expr> <S-TAB> pumvisible() ? '<C-p>' : ''
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "<CR>"

"inoremap <silent><expr> <c-space> coc#refresh()
