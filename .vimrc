set nu
syntax on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set cc=80
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
set background=dark
"
" hotkeys
map <C-n> :NERDTreeToggle<CR>
map <C-a> :"*y<CR>
map <C-A> :%y+<CR>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" indentation settings
filetype plugin indent on
" show tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" gvim options (if needed)
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" all my plugins 
call plug#begin('~/.vim/plugged') " dir = ~/.vim/plugged
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'rstudio/rmarkdown'
Plug 'bfrg/vim-cpp-modern'
Plug 'vim-syntastic/syntastic'
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'maverickg/stan.vim'
call plug#end()

" misc settings
let g:vimtex_view_method = 'zathura' " set zathura as default pdf
let g:pandoc#syntax#conceal#use = 0 " stop hiding syntax

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" because I only use c++ through rcpp:
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["cpp"] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""
" python google indentation
setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
""""""""""""""""""""""""""""""""""""""""
