set number
set guifont=Courier\ New\ 12
syntax enable
set syntax=on
set autoindent
set smartindent
set cindent
""set background=dark
""colorscheme bandit
if(has("gui_running"))
colorscheme marvin
else
colorscheme desert
endif
set ts=4
set expandtab
set shiftwidth=4

set tags=tags;
set autochdir

""au GUIEnter * simalt ~x
set guioptions-=T
set cursorline
set ic smartcase
"" for python
let OPTION_NAME = 1
let b:python_version_2 = 1
let g:python_highlight_all=1
let g:pydoc_cmd='/usr/bin/python2.7'
let g:pydiction_location='~/.vim/tools/pydiction/complete-dict'

set listchars+=tab:>\ 
set nobackup
set backupext=.bak
set scrolloff=3
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! `\"" | endif

set numberwidth=3
set autoread

set backspace=indent,eol,start
set hlsearch

filetype plugin indent on
au BufNewFile,BufRead *.py,*.pyw setf python


"ctags complete
""""""""""""""""""""""""""""""""""""""""""""""
""omni completion
""""""""""""""""""""""""""""""""""""""""""""""
set nocp
set completeopt=longest,menu
imap <silent> ` <C-X><C-O>


inoremap <C-]>             <C-X><C-]>
inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L>

let g:AutoComplPop_MappingDriven = 1
let g:pumselect = 0
inoremap <expr> <TAB>   MaySelect()
function MaySelect()
    if(pumvisible())
        let g:pumselect = 1
        return "\<DOWN>"
    endif
    return "\<TAB>"
endfunc

inoremap <expr> <Space> MayComplete()
func MayComplete()
    if (pumvisible() && g:pumselect)
        let g:pumselect = 0
        return "\<CR>"
    endif
    return "\<Space>"
endfunc

inoremap <expr> <CR> StateChangeEnter()
func StateChangeEnter()
    let g:pumselect = 0
    return "\<CR>"
endfunc""))""""))))""""))))

let g:SimpleJsIndenter_BriefMode = 1

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <F8> :WMToggle<cr>

set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
nmap <F9> :BufExplorer<cr>
function GuiTabTooltip()
	let bufnrlist = tabpagebuflist(v:lnum)
	let label = ""
	for bufnr in bufnrlist
		let fn=bufname(bufnr)
		if fn==''
			let fn="[ÎŽÃüÃû]"
		endif
		let label .=substitute(fn,'^.*\','','') .  (getbufvar(bufnr,"&modified")? ' +' : '') . "\n"
	endfor
	let len=strlen(label)-1
	if len>124
		let label=strpart(label,0,124) . '...'
	else
		let label=strpart(label,0,len)
	endif
	return label
endfunction
set guitabtooltip=%{GuiTabTooltip()}

set showmatch
map <UP> gk
map <DOWN> gj

nmap <SPACE> /<C-R>=expand("<cword>")<CR><CR>

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

set fencs=ucs-bom,utf-8,cp936

if &term == "builtin_gui"
	set encoding=utf-8
	language message zh_CN.utf-8
	" fix menu encoding
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif
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

inoremap <S-Space> <End>
set fdm=marker

""cs add ~/ngi/externals/synergy/bluetooth/cscope.out ~/ngi/externals/synergy/bluetooth
if has("cscope")  
    set csprg=/usr/local/bin/cscope  
    set csto=0  
    set cst  
    set csverb  
    set cspc=3  
    "add any database in current dir  
   "" if filereadable("cscope.out")  
    ""    cs add cscope.out  
    "else search cscope.out elsewhere  
   "" else  
       let cscope_file=findfile("cscope.out", ".;")  
 ""      let cscope_pre=matchstr(cscope_file, ".*/")  a
       let cscope_pre=getcwd()
      "" echo cscope_file
      "" echo cscope_pre
       if !empty(cscope_file) && filereadable(cscope_file)  
           exe "cs add" cscope_file cscope_pre  
       endif        
    "" endif  
endif  

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

" lookup file tag file
""if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
""endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>


" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
""let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 

" high light tags
"
" load the types.vim highlighting file, if it exists
autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
autocmd BufRead,BufNewFile *.[ch] endif

nmap <F4> :UpdateTypesFile<cr>
