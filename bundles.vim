set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" add by crpig
"Bundle 'brookhong/cscope.vim'
" create cscope database and connect to existing proper database automatically
"Bundle 'szw/vim-tags'
Bundle 'vim-scripts/a.vim'
Bundle 'Kris2k/mark.vim'
Bundle 'skroll/vim-easycolour'
Bundle 'xtrnet/TagHighlight'

"------------------
" Code Completions
"------------------
"Bundle 'Shougo/neocomplcache'
"Bundle 'mattn/emmet-vim'      webdevelop
"Bundle 'Raimondi/delimitMate'
"Bundle 'ervandew/supertab'
" Bundle 'Valloric/YouCompleteMe' " Need a newer version of vim

" snippets
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/vim-snippets'
"------ snipmate dependencies -------
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
"Bundle 'tsaleh/vim-matchit'
"Bundle 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
"Bundle 'tpope/vim-surround'   webdevelop
Bundle 'scrooloose/nerdcommenter'
"Bundle 'sjl/gundo.vim'
"Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
"Bundle 'humiaozuzu/TabBar'
Bundle 'majutsushi/tagbar'
"Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'scrooloose/syntastic'
"Bundle 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
" Bundle 'humiaozuzu/fcitx-status'
"Bundle 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
"Bundle '2072/PHP-Indenting-for-VIm'
"Bundle 'tpope/vim-rails'
"Bundle 'lepture/vim-jinja'
"Bundle 'digitaltoad/vim-jade'

"------- web frontend ----------
"Bundle 'othree/html5.vim'
" Bundle 'tpope/vim-haml'
"Bundle 'pangloss/vim-javascript'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'nono/jquery.vim'
" Bundle 'groenewege/vim-less'
" Bundle 'wavded/vim-stylus'
" Bundle 'nono/vim-handlebars'

"------- markup language -------
"Bundle 'tpope/vim-markdown'
" Bundle 'timcharper/textile.vim'

"------- Ruby --------
" Bundle 'tpope/vim-endwise'

"------- Go ----------
"Bundle 'jnwhiteh/vim-golang'

"------- FPs ------
"Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'wlangstroth/vim-racket'
" Bundle 'vim-scripts/VimClojure'
" Bundle 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
"Bundle 'vim-scripts/blackdust.vim'
"Bundle 'rickharris/vim-blackboard'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'rickharris/vim-monokai'
"Bundle 'tpope/vim-vividchalk'
"Bundle 'Lokaltog/vim-distinguished'
"Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'fisadev/fisa-vim-colorscheme'
"
"---------------
" SELF
"--------------
Bundle 'jlanzarotta/bufexplorer'
Bundle 'Rip-Rip/clang_complete'
Bundle 'taglist.vim'
Bundle 'freya'
"Bundle 'vim-scripts/winmanager'
filetype plugin indent on     " required!
