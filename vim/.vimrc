"{{{ Plugins
    call plug#begin('~/.vim/plugged')
    
    Plug 'alvan/vim-closetag'
    Plug 'junegunn/vim-easy-align' 
    Plug 'mattn/emmet-vim'
    Plug 'SirVer/ultisnips'
    Plug 'othree/html5.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-commentary'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'lervag/vimtex'
    Plug 'aperezdc/vim-template'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'jiangmiao/auto-pairs'

    call plug#end()
    "{{{ Plugins configuration
        "{{{ Closetag
            let g:closetag_filenames="*.html,*.xhtml,*.phtml,*.php"
        "}}}

        "{{{ EasyAlign
            nmap ga <Plug>(EasyAlign)
            xmap ga <Plug>(EasyAlign)
        "}}}

        "{{{ Emmet
            let g:user_emmet_install_global = 0
            autocmd FileType html,css,php EmmetInstall
            let g:user_emmet_leader_key='<C-j>'
        "}}}

        "{{{ UltiSnips
            let g:UltiSnipsEditSplit="horizontal"
        "}}}
        
        "{{{ Multiple-cursors
            let g:multi_cursor_exit_from_visual_mode=0
            let g:multi_cursor_exit_from_insert_mode=0
        "}}}

        "{{{ javascript-libraries-syntax
            let g:used_javascript_libs = 'jquery,angularjs,angularuirouter'
        "}}}
    "}}}
"}}}

"{{{{ Options
    "{{{ General Options
    set path+=**            " Display tab-completion for all file-related tasks
    set wildmenu            " Display all matching files when we tab complete
    set autoindent
    set smartindent
    set wrap
    set autoread
    set autowrite
    set background=light
    set backspace=2
    set breakindent
    set expandtab           " Insert spaces hen tab is pressed
    set number              " Show line numbers on the left side
    set ruler               " Show line and column numbers
    set linebreak
    set showcmd             " Show (Partial) command in status line
    set showmatch           " Show matching brackets
    set showmode            " Show current modez
    set modeline            " Enable modeline
    set smartcase
    set smarttab
    set tabstop=4           " Render TAB's using this many spaces
    set shiftwidth=4        " Indentation amount for < and > commands
    set softtabstop=4
    "set textwidth=80
    set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
    
    set hlsearch            " Highlight search results.
    set ignorecase          " Make searching case insensitive
    set smartcase           " ... unless the query has capital letters.
    set incsearch           " Incremental search.
    set magic               " Use 'magic' patterns (extended regular expressions).
    " Use <C-L> to clear the highlighting of :set hlsearch.
    if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
    endif

    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    "if &listchars ==# 'eol:$'
    "    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    "endif
    "set list            " Show problematic characters.
    " Highlight all tabs and trailing whitespace
    "highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    "match ExtraWhitespace /\s\+$\|\t/


    if !has('nvim')
            set encoding=utf-8
    endif
    filetype plugin indent on
    syntax on

    "}}}
"}}}

"{{{ File Type Specific
    "{{{ VIM
        augroup ft_vim
            au!
            au FileType vim setlocal foldmethod=indent
        augroup END
    "}}}
    
    "{{{ JS
        augroup ft_js
            au!
            au FileType javascript setlocal foldmethod=marker
        augroup END
    "}}}
"}}}
"
"{{{ Mappings
    "{{{ Keybindings
        autocmd filetype cpp nnoremap <F4> :!g++ % -ggdb -o %:r <CR>
        autocmd filetype cpp nnoremap<F5> :!g++ % -ggdb -o %:r && ./%:r <CR>
    "}}}
    
    "{{{ X Clipboard yanking/pasting
        nnoremap <C-c>p o<esc>"+p
        nnoremap <C-c>P O<esc>"+p
        nnoremap <C-c>y "+y
        nnoremap <C-c>Y "+Y
        vnoremap <C-c>y "+y
        inoremap <C-r>c <C-r>+
        " Ctrl variations
        nnoremap <C-c><C-p> o<esc>"+p
        nnoremap <C-c><C-y> "+y
        vnoremap <C-c><C-y> "+y
    "}}}
"}}}

"{{{ Functions
    function! Format() "{{{
        " * Removes trailing white spaces
        " * Removes blank lines at the end of the file
        " * Replaces tabs with spaces
        " * Re-Indent
        "
        " * If: C, CPP, PHP or Java code: format using 'astyle'
        " * If: Rust code: format using 'rustfmt'
        "
        " * Clear 'formatprg' so `gq` can be used with the default
        "   behavior
        silent! execute 'norm! mz'

        if &ft ==? 'c' || &ft ==? 'cpp' || &ft ==? 'php'
            setlocal formatprg=astyle\ --mode=c
            silent! execute 'norm! gggqG'
        elseif &ft ==? 'java'
            setlocal formatprg=astyle\ --mode=java
            silent! execute 'norm! gggqG'
        elseif &ft ==? 'rust'
            setlocal formatprg=rustfmt
            silent! execute 'norm! gggqG'
        endif

        silent! call RemoveTrailingSpaces()
        silent! execute 'retab'
        silent! execute 'gg=G'
        silent! execute 'norm! `z'
        setlocal formatprg=
    endfunction
    "}}}

"}}}
