
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $V = $VIM.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif

call plug#begin('~/.vim/plugged')

"Plug 'gmarik/Vundle.vim'

"代码完成
"Plug 'Shougo/neocomplete.vim'

Plug 'skywind3000/asyncrun.vim'

"代码全局查找
Plug 'mileszs/ack.vim'

"git管理工具
Plug 'tpope/vim-fugitive'

"代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"代码注释
Plug 'scrooloose/nerdcommenter'

"文本对齐
"Plug 'godlygeek/tabular'

"文件搜索
Plug 'kien/ctrlp.vim'

"高亮
"Plug 'Mark'

"状态栏增强
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"对齐线
"Plug 'Yggdroot/indentLine'
"
"文件浏览器
Plug 'scrooloose/nerdtree'

"快捷移动
Plug 'easymotion/vim-easymotion'
"
"文本对齐

"""""""""""""""""""""""""""""""""""
"配色方案
"Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'nanotech/jellybeans.vim'
"Plug 'vim-scripts/peaksea'

call plug#end()


"*************************************************************************   解决乱码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

"*************************************************************************  缩进配置
"set ci
"set si
set expandtab           
set ts=4
set shiftwidth=4 
"set softtabstop=4
"set si
set ai
set nu
set hlsearch
set backspace=2

"*************************************************************************   mac剪贴板配置

"*************************************************************************   基础配置

"smarty
autocmd BufRead,BufNewFile *.tpl setlocal ft=smarty.html.css 
autocmd BufRead,BufNewFile *.html setlocal ft=html.css
autocmd BufRead,BufNewFile *.es6 setlocal ft=javascript

set number

"允许鼠标
set mouse=a
filetype on
filetype plugin on

"开启相对行号
"set relativenumber

"开启增量搜索
set incsearch

"粘贴时不置换剪贴板
xnoremap p pgvy

"关闭omnifun，预览窗口
set completeopt=menu

"代码折叠
"set foldmethod=manual    
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=1

"开启参数提示
set noshowmode

"开启语法高亮功能
syntax enable
syntax on

"设置一行的字数
"set formatoptions=tcqmM
"set textwidth=90
"set showbreak=------
"set wrap
"set breakindent
"set breakindentopt=shift:4

"gui字体
set guifont=Monaco:h12
"关闭gui又侧滚动条
set guioptions-=r 
"隐藏菜单栏
set guioptions-=b 
"隐藏左侧滚动条
set guioptions-=L
"隐藏工具栏
set guioptions-=T
"隐藏菜单栏
set guioptions-=m

"指定配色方案为256色,设置主题
set t_Co=256
colorscheme jellybeans
"colorscheme peaksea
"colorscheme dracula
"colorscheme desert;

"高亮当前行
"set cursorline

"忽略大小写
"set ignorecase

"undofile,无限撤销
set noswapfile
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undodir
set undolevels=100 "maximum number of changes that can be undone

"自动更新.vimrc
autocmd! bufwritepost $V source %

"添加括号配对
"set mps+=<:>

"自动更新路径
"set autochdir  

"inoremap { {}<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"
"function! ParenClose() 
"	let line = getline('.') 
"	let char = line[col('.')] 
"	if char == ')'
"		execute "normal! l" 
"	else 
"		normal! a) end 
"endfunction 
"inoremap ) :call ParenClose() <cr>

"***************************************************************   emmet 配置

"替换c-y,
",m高亮启动键,:Mark 清除所有高亮
let mapleader=","
"let g:user_emmet_expandabbr_key = '<C-k>'
"let g:user_emmet_install_global = 0
"autocmd FileType html,css,tpl EmmetInstall
"let g:user_emmet_leader_key='<C-Z>'

"***************************************************************   etpl 配置
"
" 默认为`<!--`
 let g:etpl_command_open='<%'
" " 默认为`-->`
 let g:etpl_command_close='%>'
"
" " 默认`${`
" let g:etpl_variable_open='<%'
" " 默认`}`
" let g:etpl_variable_close='%>'}'}'
"
"***************************************************************   delimitMate 配置

let delimitMate_expand_space = 1
au FileType *.tpl,*.js let g:delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
au FileType *.tpl,*.js let g:delimitMate_expand_cr = 1

"***************************************************************   ctrlp配置

"let g:ctrlp_working_path_mode = 'ca'
nmap <C-p> :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlPMRU'

"***************************************************************   vimshell配置


"***************************************************************   ctrlp-funky配置
nmap <C-o> :CtrlPFunky<Cr>

"*************************************************************** YouCompleteMe +  UltiSnips + superTab配置
"YouCompleteMe
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"superTAb
"let g:SuperTabDefaultCompletionType = '<C-n>'

"***************************************************************   jsbeautiful配置
" or
autocmd FileType javascript noremap <buffer>  <c-m> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-m> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-m> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-m> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-m> :call CSSBeautify()<cr>

"***************************************************************  nerdcommenter 配置

"let NERDTreeShowBookmarks=1

"***************************************************************  nerdcommenter 配置

let g:NERDCustomDelimiters = {
    \ 'smarty': { 'left': '{%*', 'right': '*%}' },
\ }
nmap <c-/> <Plug>NERDCommenterToggle

"***************************************************************  smooth scroll 配置
"***************************************************************  unite 配置

nnoremap <C-p> :UniteWithBufferDir  -start-insert file<cr>
nnoremap <space>/ :UniteWithBufferDir -no-empty -no-resize grep<cr>
nnoremap <space>s :Unite -start-insert file_mru<cr>
nmap <space>d :UniteBookmarkAdd<cr>
nmap <C-n> :VimFiler<cr>

"***************************************************************  

"***************************************************************   syntastic配置
":SyntasticInfo 查看有哪些可用的checker
"设置特殊的检查器
"let g:syntastic_html_checkers = []
"let g:syntastic_javascript_checkers = ['eslint']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_check_on_wq = 0
""let g:syntastic_auto_loc_list = 1

"nmap <Leader>n :lne<CR>
"nmap <Leader>p :lp<CR>


"***************************************************************   fecs配置
" 不建议首次打开文件时进行检查
let g:syntastic_check_on_open = 0
" `:wq`时不进行检查，注意这跟`:w`不一样
let g:syntastic_check_on_wq = 0
" 如果你想在写文件时不进行检查，需要配置`passive`模式
" 在`passive`模式下，只有手动调用了`:SyntasticCheck`才会触发检查
 let g:syntastic_mode_map = {'mode': 'passive'} 
" 你可以配置一个快捷方式，用来快速检查当前文件
nmap <silent> <F5> :SyntasticCheck<cr>
let g:syntastic_javascript_checkers = ['fecs']
let g:syntastic_javascript_fecs_args = "--reporter=baidu"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"*************************************************************** tern_for_vim配置

"let tern_show_signature_in_pum = 1
"let tern_show_argument_hints = "on_move"

"*************************************************************** ctags配置
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 


"***************************************************************  airline 配置
" 只开上面的配置
let g:airline#extensions#tabline#enabled = 1 "buffer 状态栏
set laststatus=2
let g:airline_theme='powerlineish'

"let g:airline_powerline_fonts = 1
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'

"***************************************************************  needTree 配置

map <C-n> :NERDTreeToggle<CR>

"***************************************************************  easymotion 配置

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)


" Gif config
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)


"***************************************************************  comment标签
"
let NERD_html_alt_style=1

"***************************************************************  tabular命令

":Tab/: 以冒号对齐文本
":Tab/= 以等号对齐文本
":Tab/| 以表格对齐文本

"***************************************************************  按键映射

function! ViewInBrowser(name)
    let file = expand("%:p")
    let l:browsers = {
        \"cr":"open -a \"Google Chrome\"",
        \"ff":"open -a Firefox",
    \}
    let file = '"'. file . '"'
    exec ":update " .file
	exec ":! ". l:browsers[a:name] ." file://". file
endfunction


"调用chrome for mac
nmap <Leader>c :call ViewInBrowser("cr")<cr>   

"tab 实现缩进
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

"窗口切换
nmap gj <C-w>j
nmap gh <C-w>h
nmap gk <C-w>k
nmap gl <C-w>l

"系统复制
vmap <C-c> "+y 
"nmap <C-v> "+p

"toggle粘贴模式
:set pastetoggle=<Leader>v

"tab切换
nmap gn gT
nmap gm gt
nmap go :tabonly<cr>

"打开新的tab vimshell
"nmap <Leader>t  :VimShellTab<CR>
nmap <Leader>t  :VimShellBufferDir -popup<CR>
let g:vimshell_popup_height=100
"nmap P  <Plug>(vimshell_execute_by_background)

"翻页
map <C-j> <C-f>
map <C-k> <C-b>

"保存
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :x<CR>

"编译
nmap <leader>d :! npm run 
nmap <leader>a :! npm run test <cr>
nmap <leader>s :! npm run pub <cr>

"回到shell
nmap <leader>e :sh<cr>


"反撤销
nmap <S-u> <C-r>

"左右切换buffer
"noremap <silent> <Left> :bp<CR>
"noremap <silent> <Right> :bn<CR>

"shell优化
"command -nargs=+ R :cexpr system('<args>') | copen

"toogle注释
map <C-_> <plug>NERDCommenterToggle

"改变光标的状态
"if exists('$ITERM_PROFILE')
  "if exists('$TMUX') 
    "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    "let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  "else
    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  "endif
"end


"常用文件
nmap <Leader>1 :tabnew $MYVIMRC <CR>
nmap <Leader>3 :tabnew ~/.vim/bundle/vim-snippets/UltiSnips/javascript.snippets<CR>
nmap <Leader>r :tabnew ~/myClould/research/
nmap <Leader>b :tabnew /Volumes/mywork/odp/template/search/searchaladdin/c_base/inc_pub.tpl<cr>
"nmap <Leader>m :silent ! cd ~/baidu/www-wise; wwwbuild --all <cr> <C-l>
"nmap <Leader>t :tabnew /Volumes/mywork/odp/template/search/searchaladdin/
"nmap <Leader>u :tabnew /Volumes/mywork/odp/conf/ral/services/wise.conf<cr>
"nmap <Leader>p :!findphp  <CR>
