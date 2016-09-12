"{{{ Plugins
    call plug#begin('~/.vim/plugged')
    
    Plug 'alvan/vim-closetag'
    Plug 'danielecal/vim-tmux-navigator', { 'branch': 'vim-tmux-wm-screen' }
    Plug 'junegunn/vim-easy-align' 
    Plug 'pangloss/vim-javascript'
    Plug 'mattn/emmet-vim'

    call plug#end()
    "{{{ Plugins configuration
        "{{{ Vim-tmux-navigator
            let g:tmux_navigator_no_mappings = 1
            let g:tmux_navigator_save_on_switch = 1
        "}}}

        "{{{ EasyAlign
            nmap ga <Plug>(EasyAlign)
            xmap ga <Plug>(EasyAlign)

            let g:easy_align_delimiters = {
                \ '/': {
                \     'pattern':         '//\+\|/\*\|\*/',
                \     'delimiter_align': 'l',
                \     'ignore_groups':   ['!Comment'] }
                \ }
        "}}}

        "{{{ Closetag
            let g:closetag_filenames="*.html,*.xhtml,*.phtml,*.php"
        "}}}

        "{{{ Emmet
            let g:user_emmet_install_global = 0
            autocmd FileType html,css,php,blade EmmetInstall
            let g:user_emmet_leader_key='<C-j>'
        "}}}
    "}}}
"}}}

"{{{{ Options
    "{{{ General Options
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
    set textwidth=80
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
            au FileType javascript setlocal foldmarket={,}
        augroup END
    "}}}
"}}}
"
"{{{ Mappings
    "{{{ Window movement
        nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
        nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    "}}}
"}}}
