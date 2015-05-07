source ~/.vim/bundles.vim

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

" highlight current line
" au WinLeave * set nocursorline nocursorcolumn
" au WinEnter * set cursorline cursorcolumn
" set cursorline cursorcolumn
"au WinLeave * set nocursorline  " 离开窗口时取消高亮
"au WinEnter * set cursorline    " 进入窗口是设置高亮
set cursorline                  " 高亮当前行

" search
"set incsearch   " 即时显示输入的搜索字符，按ESC退回到原点
"set highlight 	" conflict with highlight current line

" 使用空格搜索当前单词，并高亮搜索结果 nohlsearch暂时取消高亮
set hlsearch

" 忽略大小写
set ignorecase
set smartcase

" editor settings
set history=1000
"set nocompatible
"set nofoldenable                                                  " disable folding 打开所有的折叠
"set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                 " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
"set report=0                                                 " always report number of lines changed     "
" set nowrap                                                        " dont wrap lines 不拆行
set scrolloff=3                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
"set showmatch                                                     " show matching bracket (briefly jump)
"set showcmd                                                       " show typed command in status bar
"set title                                                         " show file in titlebar
"set matchtime=2                                                   " show matching bracket for 0.2 seconds
"set matchpairs+=<:>                                               " specially for html
"set shortmess=atI                                                 " 隐藏启动时的提示，缩写一些command
"set relativenumber                                                " 显示相对于当前行的行号
set autochdir                                                     " 自动切换目录为当前文件所在目录
"set foldenable                                                    " 启用所有折叠 zi可以切换
"set foldmethod=indent                                             " indent 折叠方式
"set foldlevel=99
set lazyredraw

" 开关折叠选项
"nnoremap m @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" for ctags
set tags=tags;                                                    " 自动向上寻找tags文件

" for file buffer
" shift+Tab 上一个Buffer文件 Tab:下一个Buffer文件
"set hidden              " in order to switch between buffers with unsaved change 切换buffer时不显示提示信息
"map <S-Tab> :bp<CR>
"map <Tab> :bn<CR>

" Default Indentation
set autoindent      " o/O开启新行时，用当前行的缩进，ESC可以回到行首
set smartindent     " indent when  类似于autoindent,主要是给C用的
set tabstop=4       " tab width  tab代表的空格数
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set textwidth=79
" set smarttab
set expandtab       " expand tab to space

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
"autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"-----------------
" Plugin settings
"-----------------
let mapleader = ","     " 设置leader为,

if has("gui_running")
    "set guifont=Ubuntu\Mono\ 13
    set guifont=Courier\10\Pitch\ 12
    "set guifont=YaHei\Consolas\Hybrid\ 12
    set guioptions-=T
    set background=dark
    colorscheme solar
else
    set background=dark
    set guifont=Courier\10\Pitch\ 12
    colorscheme desert
endif

set nobackup
set backupext=.bak

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! `\"" | endif

"for old configuration"
set numberwidth=3
set autoread
set ic smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" TAG LIST & WIN MANAGER
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout='FileExplorer'
"nmap <F8> :WMToggle<cr>
"nmap <C-o> :WMToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" CSCOPE
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cscopequickfix=s-,c-,d-,i-,t-,e-

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

if has("cscope")  
    set csprg=/usr/local/bin/cscope  
    set csto=0  
    set cst  
    set csverb  
    set cspc=3  
    let cscope_file=findfile("cscope.out", ".;")  
    let cscope_pre=getcwd()
    if !empty(cscope_file) && filereadable(cscope_file)  
        exe "cs add" cscope_file cscope_pre 
    endif        
endif  




""""""""""""""""""""""""""""""""""""""""""
"
"   LOCAL SETTING
"
"""""""""""""""""""""""""""""""""""""""""""
nmap <F7> :cp<cr>
nmap <F6> :cn<cr>
nmap <F9> :BufExplorer<cr>
nmap <F12> :A<cr>
"nmap <C-\> :tag <C-R>=expand("<cword>")<CR><CR>
"nmap <C-y> :tag<CR><CR>





""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" CLANG COMPLETE
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_complete_copen = 1
let g:clang_complete_auto = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_auto_select = 1
let g:clang_hl_errors = 1
let g:clang_periodic_quickfix = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_close_preview = 1
let g:clang_use_library = 1
"let g:clang_user_options = '-stdlib=libstdc++ -std=c++11 -IIncludePath'
let g:clang_user_options = '-IIncludePath'

let g:clang_jumpto_declaration_key = '[C-[]'
let g:clang_jumpto_back_key = '[C-Y]'

let g:neocomplcache_enable_at_startup = 1

set completeopt=menu,longest




"""""""""""""""""""""""""""""
"
" TAG BAR
"
"""""""""""""""""""""""""""""
let g:tagbar_width=25
let g:tagbar_left=1
let g:tagbar_autoclose=1
nmap <C-l> :TagbarToggle<CR>





"""""""""""""""""""""""""""""
"
" NERD TREE
"
"""""""""""""""""""""""""""""
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinPos = "right"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
nmap <C-o> :NERDTreeToggle<cr>





""""""""""""""""""""""""""""""""""""""
"
"       CtrlP script
"
""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = ',,'      " 将CtrlP的快捷键设置为,,
let g:ctrlp_by_filename = 1 " 搜索时只使用文件名，不带路径
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'     " 忽略这些版本管理目录
let g:ctrlp_root_markers = ['lookupfiles.sh']                     " 优先寻找.git作为root目录
nnoremap <Leader>. :CtrlPTag<CR>






"""""""""""""""""""""""""""''"""""""""""""""""""""""""""
"
" 括号 自动匹配
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""" inoremap ( ()<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

inoremap <expr> ; CSemiColon()
func CSemiColon()
    let line = getline(".")
    if stridx(line,'for')!=-1
        return ';'
    endif
    let col = col(".")
    let ll = len(line)
    let flag = 1
    let dict = {')':1,']':1,' ':1, '}':1}
    while col <= ll
        let c = line[col-1]
        if !has_key(dict,c)
            let flag = 0
            break
        endif
        let col = col + 1
    endwhile
    return flag ? "\x1BA;" : ";"
endf

inoremap <expr> { CCur()
func CCur()
    let line = getline(".")
    if stridx(line,'//')!=-1
        return "{}\x1Bi"
    endif
    let col = col(".")
    let ll = len(line)

    let tmpcol = col-2
    while line[tmpcol] == ' '
        let tmpcol = tmpcol - 1
    endwhile

    if line[tmpcol] == '='
        return "{}\x1Bi"
    endif

    if(tmpcol == -1)
        return "\x1BA{\x0D}\x1Bko"
    endif

    let flag = 1
    let dict = {')':1,']':1,' ':1}

    while col <= ll
        let c = line[col-1]
        if !has_key(dict,c)
            let flag = 0
            break
        endif
        let col = col + 1
    endwhile
    return flag ? "\x1BA\x0D{\x0D}\x1Bko" : "{}\x1Bi"
endf












""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <expr> <BS> CBS()
func CBS()
    let line = getline(".")
    let col = col(".")
    let step = 0

    if line[col-1] == ')' && line[col-2] == '(' 
        return "\x1Bxxa"
    endif
    if line[col-1] == ']' && line[col-2] == '[' 
        return "\x1Bxxa"
    endif
    if line[col-1] == '}' && line[col-2] == '{' 
        return "\x1Bxxa"
    endif
    if line[col-1] == '"' && line[col-2] == '"' 
        return "\x1Bxxa"
    endif
    if line[col-1] == "'" && line[col-2] == "'"
        return "\x1Bxxa"
    endif

    return "\x08"
endf














""""""""""""""""""""""""""""""""""""""""""""""""
"
"   HOME MAPPING
"
"""""""""""""""""""""""""""""""""""""""""""""""""
"set fencs=ucs-bom,utf-8,cp936

inoremap <expr> <Home> HomeMapping()
func HomeMapping()
    let line = getline(".")
    let col = col(".")
    if col > strlen( line )
        let line .= 'a'
    endif
    let s=strpart(line,0,col)
    if -1==match(s,'^\s*\S$')
        " go to the first non-blank column
        return "\x1B^i"
    endif
    " go to the first column
    return "\x1B1|i"
endf

inoremap <S-Space> <End> "set fdm=marker




""""""""""""""""""""""""""""""""""""""""""""""""
"
" lookupfile setting
"
""""""""""""""""""""""""""""""""""""""""""""""""
"let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
"let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 0     "保存查找历史
"let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
"let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

" lookup file tag file
"let lookupfiletags_t = findfile("filenametags", ".;")
"if filereadable(lookupfiletags_t)
"let lookupfiletags = '"'
"let lookupfiletags .= lookupfiletags_t
"let lookupfiletags .= '"'
""let g:LookupFile_TagExpr = '"./filenametags"'
"let g:LookupFile_TagExpr = lookupfiletags
"echo g:LookupFile_TagExpr
"endif
"映射LookupFile为,lk
"nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
"nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
"nmap <silent> <leader>lw :LUWalk<cr>


" lookup file with ignore case
"function! LookupFile_IgnoreCaseFunc(pattern)
"let _tags = &tags
"try
"let &tags = eval(g:LookupFile_TagExpr)
"let newpattern = '\c' . a:pattern
"let tags = taglist(newpattern)
"catch
"echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
"return ""
"finally
"let &tags = _tags
"endtry

" Show the matches for what is typed so far.
"let files = map(tags, 'v:val["filename"]')
"return files
"endfunction
"let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 



"""""""""""""""""""""""""""""""""""""""""""""
"
" TAG HIGH LIGHT
"
"""""""""""""""""""""""""""""""""""""""""""""""

"load the types.vim highlighting file, if it exists
autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
autocmd BufRead,BufNewFile *.[ch] endif

if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif

"let g:TagHighlightSettings['TagFileName'] = 'types.vim'
"let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'
"let g:TagHighlightSettings['LanguageDetectionMethods'] = ['Extension', 'FileType']
"let g:TagHighlightSettings['FileTypeLanguageOverrides'] = {'tagbar': 'c'}
"let g:TagHighlightSettings[''] = True

nmap <F4> :UpdateTypesFile<cr>



""""""""""""""""""""""""""""""""""""""
"
"       powerline script
"
""""""""""""""""""""""""""""""""""""""
set laststatus=2                                                  " use 2 lines for the status bar 总是显示状态栏

"autocmd BufReadPost,FileReadPost *.[ch] exec ":PowerlineReloadColorscheme"


nmap <leader>rr :PowerlineReloadColorscheme<CR>
if has("gui_running")
    "let g:Powerline_symbols = 'fancy'   " Only use in GUI
endif


""""""""""""""""""""""""""""""""""""""""""""""
"
"      high light search
"
"""""""""""""""""""""""""""""""""""""""""""""""
nmap <Space>  :call SpaceForSearch()<CR>

func SpaceForSearch()
    let curSearch = getreg('/')
    let curWord = expand("<cword>")
    let line = getline(".")
    let col = col(".")-1
    let curSearchLen = strlen(curSearch)

    if (strlen(line) - col) < curSearchLen || empty(curSearch)
        call setreg('/', curWord)
        "if col != 0 && line[col-1] != ' ' && line[col-1] != '"' && line[col-1] != '('
        if col != 0 && match(' "(=', line[col-1]) == -1
            exec 'norm b'
        endif
    else
        let s = strpart(line, col, strlen(curSearch))
        if s ==? curSearch
            exec 'norm n'
        else
            call setreg('/', curWord)
            "if col != 0 && line[col-1] != ' ' && line[col-1] != '"' && line[col-1] != '('
            if col != 0 && match(' "(=', line[col-1]) == -1
                exec 'norm b'
            endif
        endif
    endif

    "
    "if (match(curWord, curSearch) == -1)
    "call setreg('/', curWord, '1')
    "else
    "exec 'norm n'
    "endif

endf


""""""""""""""""""""""""""""""""""""""""""""""
"
"      max window
"
"""""""""""""""""""""""""""""""""""""""""""""""

function Maximize_Window()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Doxygen 
"
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return   "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="Connectivity Group."

let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="no"
let g:doxygen_enhanced_color=1

nmap <leader>d :Dox<CR>
nmap <leader>f :DoxAuthor<CR>
nmap <leader>l :DoxLic<CR>




"""""""""""""""""""""""""'""""""""""""""""""""""""""""""
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function InsertHeadDef(firstLine, lastLine)
    if a:firstLine <1 || a:lastLine> line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '#ifndef __'.definename."__")
    normal ==o
    call setline('.', '#define __'.definename."__")
    normal == o
    normal == o

    call setline('.', '#ifdef __cplusplus')
    normal == o
    call setline('.', 'extern "C" {')
    normal == o
    call setline('.', '#endif')
    normal == o
    normal == o

    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    normal == o
    call setline('.', '#ifdef __cplusplus')
    normal == o
    call setline('.', '}')
    normal == o
    call setline('.', '#endif')
    normal == o
    normal == o
    call setline('.', '#endif')

    let goLn = a:firstLine+5
    exe 'normal =='.goLn.'G'

endfunction
function InsertHeadDefN()
    let firstLine = 1
    let lastLine = line('$')
    let n=1
    while n < 20
        let line = getline(n)
        if n==1 
            if line =~ '^\/\*.*$'
                let n = n + 1
                continue
            else
                break
            endif
        endif
        if line =~ '^.*\*\/$'
            let firstLine = n+1
            break
        endif
        let n = n + 1
    endwhile
    call InsertHeadDef(firstLine, lastLine)
endfunction

function InsterHeaderForPython()
    call setline('.', '#! /usr/bin/env python')
    normal == o
endfunction


autocmd FileType c,cpp nmap <leader>ha :call InsertHeadDefN()<CR>
autocmd FileType python nmap <leader>ha :call InsterHeaderForPython()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   Automatic create structure and switch case by define or enum
"
"
""""""""""""""""""""""""""""""""''"""""""""""""""""""""""""""""""

func CreateStructFromName(name)
    call setline('.', 'typedef struct')
    normal == o
    call setline('.', '{')
    normal == o
    call setline('.', '} ' . a:name . '_T;')
    normal == o
endf

func CreateSwitchFromName(name)
    call setline('.', 'case ' . a:name . ':')
    normal == o
    call setline('.', 'break;')
    normal == o
endf


func ParseDataFromDefine(type)
    let curReg = getreg('"')
    let lines = split(curReg, '\n')
    let len = len(lines)

    if a:type == 1
        call setline('.', 'switch (#) {')
        normal == o
    endif

    for i in range(len)
        let words = split(lines[i])
        if len(words) == 0
            continue
        endif

        if len(words) == 1
            if words[len(words)-1] == ','
                words = words[:len(words)-2]
            endif

            if a:type == 0
                call CreateStructFromName(words[0])
            else
                call CreateSwitchFromName(words[0])
            endif
        endif


        if match(words[0], '#define') != -1
            if a:type == 0
                call CreateStructFromName(words[1])
            else
                call CreateSwitchFromName(words[1])
            endif
        endif

    endfo

    if a:type == 1
        call setline('.', 'default:')
        normal == o
        call setline('.', 'break;')
        normal == o
        call setline('.', '}')
        normal == o
    endif
endf

nmap <leader>st :call ParseDataFromDefine(0)<CR>
nmap <leader>w :call ParseDataFromDefine(1)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   C.VIM
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:C_LineEndCommColDefault    = 45

"au BufRead,BufNewFile  *.XYZ  set filetype=c
"let g:C_SourceCodeExtensions  = 'XYZ c cc cp cxx cpp CPP c++ C i ii'

"let  g:C_UseTool_cmake    = 'yes' 
"let  g:C_UseTool_doxygen = 'yes'
"

"
" vim-airline
if has('gui_running')
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_section_b = "%{fnamemodify(bufname('%'),':p:.:h').'/'}"
" let g:airline_section_c = '%t'
let g:airline_section_warning = airline#section#create(['syntastic'])

nmap <leader>t :bn<CR>
nmap <leader>p :bp<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" python complete
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
