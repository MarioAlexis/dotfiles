set nocompatible    " Be iMproved!

" ====================================
"   First time load, install plugins
" ====================================
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    if executable('git')
        !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        !vim +PluginInstall +qall && mkdir -p ~/.vim/undo && mkdir -p ~/.vim/swap
    else
        echom "Please install git to allow plugin configuration through Vundle"
    endif
endif


" ====================================
"   Plugin management with Vundle
" ====================================
filetype off                    " Must be off before Vundle has run
if isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    set runtimepath+=~/.vim/bundle/Vundle.vim
    " :PluginInstall, :PluginUpdate, :PluginClean
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'              " Manage plugins with Vundle
    Plugin 'vim-airline/vim-airline'        " Status bar at the bottom
    Plugin 'morhetz/gruvbox'                " Colorscheme
    Plugin 'majutsushi/tagbar'              " Code navigation: displays tags in a window, ordered by scope
    Plugin 'scrooloose/nerdtree'            " A tree explorer plugin for vim
    Plugin 'Xuyuanp/nerdtree-git-plugin'    " A plugin of NERDTree showing git status
    Plugin 'tpope/vim-fugitive'             " A Git wrapper for Vim

    " Python stuff
    " Plugin 'klen/python-mode'               " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
    " Plugin 'davidhalter/jedi-vim'           " Using the jedi autocompletion library for VIM.

    call vundle#end()
endif
filetype plugin indent on       " And turn it back on!


" ====================================
"   Vim configuration
" ====================================
syntax enable           " Syntax highlighting
set background=dark     " When set to dark, Vim will try to use colors that look good on a dark background.  When set to light, Vim will try to use colors that look good on a light background.
set cursorline          " Highlight the screen line of the cursor with CursorLine

set number          " Print the line number in front of each line
set nowrap          " When on, lines longer than the width of the window will wrap and displaying continues on the next line. When off lines will not wrap and only part of long lines will be displayed.
set hlsearch        " When there is a previous search pattern, highlight all its matches
set incsearch       " While typing a search command, show where the pattern, as it was typed so far, matches
set expandtab       " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set cindent         " Enable automatic C program indenting
set autoindent      " Copy indent from current line when starting a new line
set hidden          " When off a buffer is unloaded when it is |abandon|ed. When on a buffer becomes hidden when it is |abandon|ed.

set foldmethod=syntax   " The kind of folding used for the current window. Syntax highlighting items specify folds.
set foldlevelstart=20   " Sets 'foldlevel' when starting to edit another buffer in a window. [All folds closed (value zero), some folds closed (one) or no folds closed (99)]

filetype indent on
autocmd FileType            make set noexpandtab                                                        " In makefiles only
autocmd BufRead,BufNewFile  *.html,*.php setl shiftwidth=2 softtabstop=2 expandtab foldmethod=indent    " foldmethod=indent: Lines with equal indent form a fold
autocmd BufRead,BufNewFile  *.c,*.cpp,*.h setl shiftwidth=4 softtabstop=4 expandtab                     " softtabstop: Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
autocmd BufRead,BufNewFile  *.py setl foldmethod=indent textwidth=79                                    " textwidth: Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.

set fileformats=unix,dos            " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer
set omnifunc=ccomplete#Complete     " This option specifies a function to be used for Insert mode omnicompletion with CTRL-X CTRL-O. (Struct member autocomplete, C only, if YCM is not used)
set laststatus=2                    " The value of this option influences when the last window will have a status line (0: never | 1: only if there are at least two windows | 2: always)
" set list                          " List mode: Show tabs as CTRL-I is displayed, display $ after end of line
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<   " Strings to use in 'list' mode and for the |:list| command

set undofile                        " When on, Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read
set undodir=~/.vim/undo/            " List of directory names for undo files, separated with commas
set backupdir=~/.vim/swap//,.,/tmp  " List of directories for the backup file, separated with commas
set directory=~/.vim/swap//,.,/tmp  " List of directory names for the swap file, separated with commas

" When you type the first tab hit will complete as much as possible, the second tab hit will provide a list, the third and subsequent tabs will cycle through completion options so you can complete the file without further keys
set wildmode=longest,list,full      " Complete till longest common string -> When more than one match, list all matches -> Complete the next full match
set wildmenu                        " When 'wildmenu' is on, command-line completion operates in an enhanced mode.


" ====================================
"   Vimdiff configuration
" ====================================
if &diff
    set diffopt+=iwhite     " Ignore changes in amount of white space in vimdiff
endif


" ====================================
"   Cscope configuration
" ====================================
if has('cscope')
    set cscopetag

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    if filereadable("cscope.out")
        try
            cs add cscope.out
        catch /^Vim\%((\a\+)\)\=:E568/
        endtry
    endif

    "" cscope/vim key mappings
    "   's'   symbol:   find all references to the token under cursor
    "   'g'   global:   find global definition(s) of the token under cursor
    "   'c'   calls:    find all calls to the function name under cursor
    "   't'   text:     find all instances of the text under cursor
    "   'e'   egrep:    egrep search for the word under cursor
    "   'f'   file:     open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called:   find functions that function under cursor calls

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\><C-\>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\><C-\>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\><C-\>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>V
endif


" ====================================
"   Plugin configuration
" ====================================
if &runtimepath =~ 'gruvbox'
    let g:gruvbox_contrast_dark = 'hard'    " Changes dark mode contrast. Possible values are soft, medium and hard.
    colorscheme gruvbox                     " Fancy color theme
else
    colorscheme desert                      " Less fancy color theme
endif

if &runtimepath =~ 'vim-airline'
    " General configuration
    let g:airline#extensions#whitespace#enabled = 1     " Enable/disable detection of whitespace errors
    let g:airline#extensions#tabline#enabled = 1        " Enable/disable bufferline integration (enable the list of buffers at the top)
    let g:airline#extensions#tabline#fnamemod = ':t'    " Formatting of filenames (only show the filename)
    let g:airline#extensions#tabline#buffer_nr_show = 1 " Configure whether buffer numbers should be shown

    " Fancy Powerline fonts
    let g:airline_powerline_fonts = 1   " Enable/disable automatic population of the 'g:airline_symbols' dictionary with powerline symbols (needs https://github.com/powerline/fonts)

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}      " When a powerline font is not installed, define empty powerline symbols
    endif

    " Unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " Powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

    " Custom settings
    let g:airline_symbols.maxlinenr = ''
endif
