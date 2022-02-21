" NOTE: Leader key of nvim is '\', we modified it as SPC
" NOTE: Support python,shell,c++,markdown,latex for now
" NOTE: Using :message to get the details of plugins err
" https://www.cnblogs.com/cniwoq/p/13272746.html

" TODO: register another leader key like g,Ctrl,Alt In the future
" TODO: Improve the folding with diff langs. and set the keyshort for unfold
" TODO: Change nvim to lua and setting todo
" TODO: update the plugins to new version of lua.
" TODO: Learning the opperation of those plugins
" TODO: Setting up myself's keymap
" TODO: may setting up latex as extend function for nvim
" TODO: try support debug like VSCODE

" Change the Download Link
" let g:plug_url_format='https://git::@github.com.cnpmjs.org/%s.git'

call plug#begin('~/.config/nvim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vim-which-key'
" Plug 'szymonmaszke/vimpyter'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'master'}
" Themes
Plug 'liuchengxu/space-vim-dark'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Focus Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

" change the leader key as space
let mapleader = "\<space>"

" set nowrap "自动换行
set nonu  "显示行号
set wrap
set clipboard=unnamed "共享剪切板
set nocompatible
set backup "生成临时文件
set noswapfile " i dont like swap files
set history=1000

" 高亮搜索结果，逐词高亮
set hlsearch
set incsearch
" 搜索忽视大小写
set ignorecase
set smartcase
" 显示匹配的括号
set showmatch

" 文件在外部被修改过，就重新读入
set sessionoptions+=globals
" 延迟绘制提升性能
set lazyredraw
" 显示确认
set confirm

set tabstop=4 " Tab键的宽度
set expandtab
set smarttab
set shiftwidth=4
set autoindent
set cindent
set si
set wildmenu

"set paste
autocmd InsertLeave * set nopaste "结束插入模式的时候关闭paste

autocmd BufWritePost $MYVIMRC source $MYVIMRC

" using tab and shift tab to get indent{{{
nmap <tab> V>
nmap <S-tab> V<
vmap <tab> >gv
vmap <S-tab> <gv
"}}}

" switch windows keyshort mapping setting{{{
" https://vim.fandom.com/wiki/Switch_between_Vim_window_splits_easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" del the end space of line
nnoremap <leader>de :%s/\s\+$//<cr>:let @/=''<CR>
" replace space as tab to solve the mix indent problem
nnoremap <leader>ds :retab!<CR>
" edit the nvim config file
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" vim-commentary keyshort add <SPC> + /
nmap <leader>/ <PLUG>CommentaryLine
" }}}

" {{{compile and run script
" 编译，运行，然后删除对应的编译文件，使得更为整洁，如果是大型的任务在做修改
set showcmd "show the cmd before carry out on vim
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
        exec '!rm ./%<'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'sh'
        :!time sh %
    endif
endfunc<Paste>

"running python in nvim
"nnoremap <F5> :echo system('python3 "' . expand('%') . '"')<cr>

" running cpp in nvim
" map <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
" nnoremap <silent> <F8> :!clear;g++ % -o % && ./%< <CR>
"}}}

" {{{ colorscheme and ui setting
" set true color
set background=dark

" set themes
" gruvbox
" colorscheme gruvbox

" NeoSolarized
colorscheme NeoSolarized
let g:neosolarized_termtrans=1
runtime ./colors/NeoSolarized.vim

" Onedark
" https://github.com/joshdick/onedark.vim
" we should change this in the airline setting
" colorscheme onedark
" let g:airline_theme = 'onedark'

" space-vim-dark
" https://github.com/liuchengxu/space-vim-dark
" colorscheme space-vim-dark
" hi Comment cterm=italic
" hi LineNr ctermbg=NONE guibg=NONE

" one-half
" https://github.com/sonph/onehalf/tree/master/vim
" colorscheme onehalfdark

highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

"hi Normal ctermfg=252 ctermbg=none "背景透明
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

syntax on
set cul "highlight cursorline
"set cuc

" set termguicolors
set t_Co=256
set laststatus=2
set ruler
"}}}

"{{{ setting folding method
" https://www.cnblogs.com/zlcxbb/p/6442092.html
"
" set foldmethod=syntax
" set foldlevel=1 "预设开始时不收起

autocmd FileType python,markdown set foldmethod=indent
" autocmd FileType python,markdown set foldlevel=1
autocmd FileType python,markdown let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

autocmd FileType cpp set foldmethod=marker
autocmd FileType cpp set foldmarker={,}
" :autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
autocmd FileType cpp let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

autocmd FileType vim set foldmarker={{{,}}}
autocmd FileType vim set foldmethod=marker
autocmd FileType vim set foldlevel=0

" let php_folding=1
set foldnestmax=3

"}}}

" {{{support chines
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" }}}

" support mouse opeartion{{{
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" }}}

" support conda python{{{
let g:python3_host_prog='/home/aikenhong/anaconda3/bin/python'
" }}}

" indent guide setting{{{
" setting the indent guide line
let g:indent_guilds_guide_size=1
let g:indent_guilds_start_level=2
" }}}

" rainbow_pairs setting {{{
" enable the rainbow pairs
let g:rainbow_active=1
"}}}

" nerdtree setting{{{
let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
" autocmd vimenter * if !argc()|NERDTree|endif "当没有打开文件的时候自动打开
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
let NERDTreeWinPos="right"
"}}}

" airline setting{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
" some recommand theme: papercolor, violet, base16, bubblegum
let g:airline_theme = 'violet'  " 主题
" set powerline for airline
let g:airline_powerline_fonts=1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}

" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>t5 <Plug>AirlineSelectTab5
nmap <leader>t6 <Plug>AirlineSelectTab6
nmap <leader>t7 <Plug>AirlineSelectTab7
nmap <leader>t8 <Plug>AirlineSelectTab8
nmap <leader>t9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>tq :bp<cr>:bd #<cr>
"}}}

" tagbar setting{{{
" need to install Universal Ctags
" https://github.com/preservim/tagbar/wiki#markdown
let g:tagbar_width=30
nnoremap <silent> <F2> : TagbarToggle<CR> "设置tagbar的开关为F2
let g:tagbar_ctags_bin='ctags'
let g:tagbar_left=1
" let g:tagbar_autofocus=1

let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'      : {
    \ 'chapter'       : 'c',
    \ 'section'       : 's',
    \ 'subsection'    : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection'  : 'T',
  \ },
\ }

"}}}

" leaderF shortcut setting{{{
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>F"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf Tag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <silent> <leader>ff :Leaderf function<CR>
noremap <silent> <leader>fF :Leaderf file<CR>
noremap <silent> <leader>frg :Leaderf rg<CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'

noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"}}}

" entry page setting {{{
" setting the entry pages
autocmd VimEnter *
            \ if !argc()
            \ | Startify
            \ | NERDTree
            \ | wincmd w
            \ | endif
"}}}

" {{{vim-autoformat setting
noremap <F10> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1

" }}}

" {{{vim-markdown setting
" " disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" augroup pandoc_syntax
    " au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" }}}

" markdown preview setting{{{
" mapping the key to leader for ez use
nmap <leader>dm :MarkdownPreview<CR>
nmap <leader>dc :MarkdownPreviewStop<CR>
" do not close the preview tab when switching to other buffers
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" }}}

" {{{gui gutter setting
let g:gitgutter_sign_modified = 'M'
highlight GitGutterAdd ctermfg=blue
highlight GitGutterChange ctermfg=green
highlight GitGutterDelete ctermfg=red
" }}}

" coc_config setting"{{{
" ------------------------------------------------------
" i hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> <leader>ad <Plug>(coc-definition)
nmap <silent> <leader>at <Plug>(coc-type-definition)
nmap <silent> <leader>ai <Plug>(coc-implementation)
nmap <silent> <leader>ar <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <leader>aK :call <SID>show_documentation()<CR>

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
nmap <leader>an <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>ak  <Plug>(coc-format-selected)
nmap <leader>ak  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>aa  <Plug>(coc-codeaction-selected)
nmap <leader>aa  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"}}}

" goyo and limelight setting {{{
let g:goyo_height=95
let g:goyo_width=90

nmap <leader>l :Goyo<CR>
xmap <leader>l :Goyo<CR>
" 进入goyo自动出发limelight，推出自动关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 5

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" }}}

" which-key setting{{{
" Map leader to which_key
" https://blog.csdn.net/niuiic/article/details/109170880
" https://www.chrisatmachine.com/Neovim/15-which-key/
" https://cloud.tencent.com/developer/article/1354570
let g:maplocalleader = '\'
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>

" Define aseparator
let g:which_key_sep = '⚡'
set timeoutlen=300

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map = {}
" mapping the fuzzy search
let g:which_key_map.f = {
            \ 'name' : 'FuzzySearch',
            \ 'l' : 'Line',
            \ 'b' : "Buffer",
            \ 'd' : "FindD",
            \ 'm' : "Mru:history file",
            \ 'n' : "FindN",
            \ 'o' : "FindO",
            \ 'p' : "Findp",
            \ 'r' : "Findr",
            \ 't' : "Tag",
            \ 'F' : "File",
            \ 'f' : "Funtion",
            \}

" mapping the tab opperation
let g:which_key_map.t = {
            \ "name" : "TabChange",
            \ "5" : "Sw->buff 5",
            \ "6" : "Sw->buff 6",
            \ "7" : "Sw->buff 7",
            \ "8" : "Sw->buff 8",
            \ "9" : "Sw->buff 9",
            \ "q" : "close tab"
            \}

" mapping the switching
let g:which_key_map.1 = 'Sw->buff 1'
let g:which_key_map.2 = 'Sw->buff 2'
let g:which_key_map.3 = 'Sw->buff 3'
let g:which_key_map.4 = 'Sw->buff 4'
" TODO may register other leader-key like g or alt, ctrl
" but finish this when we was free
let g:which_key_map['/'] = 'CommentLine'

" mapping 2 del the tailling
let g:which_key_map.d = {
            \ 'name' : "Edit",
            \ 'e' : "DelTail",
            \ 's' : "SPC->TAB",
            \ 'm' : "Preview MD",
            \ 'c' : "Stop Pre MD"
            \ }

let g:which_key_map.e = {
            \ 'name' : "Env",
            \ 'v' : "EditConfig",
            \ }

let g:which_key_map.a = {
            \ 'name' : "CocAction",
            \ 'a' : "paragraph action",
            \ 'c' : "line action",
            \ 'k' : "format line",
            \ 'f' : "auto fix curLine",
            \ 'n' : "rename curr word",
            \ 'd' : "go to definition",
            \ 't' : "goto type definition",
            \ 'i' : 'goto implement',
            \ 'r' : 'goto references',
            \ 'K' : 'Documentation'
            \ }

let g:which_key_map['h'] = [ '<C-W>s'    , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'    , 'split right']
let g:which_key_map['S'] = [':Startify'  , 'start screen']
let g:which_key_map['H'] = [':history'   , 'history command']
let g:which_key_map['s'] = [':w'         , 'SaveFile']

let g:which_key_map.b = "=FindTag"

" register second hint key, the first is Leader-Space
" now we register the folder one, <z>
" the window-opperation should catch out attention too
let g:which_key_map.z = {
            \ 'name' : "Folding",
            \  'a': ['za' , "open/close THIS"],
            \  'c': ['zc' , "close THIS"],
            \  'o': ['zo' , "open THIS"],
            \  'm': ['zm' , "close ALL"],
            \  'M': ['zM' , "r close ALL"],
            \  'r': ['zr' , "open ALL"],
            \  'R': ['zR' , "r open ALL"],
            \  'd': ['zd' , "delele this fold"],
            \  'E': ['zE' , "delete all fold"],
            \  'j': ['zj' , "move2next fold"],
            \  'k': ['zk' , "move2prec fold"],
            \  'n': ['zn' , "Disable fold"],
            \  'N': ['zN' , "Enable fold"],
            \ }

call which_key#register('<Space>', "g:which_key_map")
"}}}

" startify setting{{{
" TODO: seesion save and load
" TODO: simplify the startup list is necessary.
let g:ascii= [
\ '',
\ '    ___    ______ __ _______   ____  ___      _    ________  ___ ',
\ '   /   |  /  _/ //_// ____/ | / / / / ( )____| |  / /  _/  |/  /  ',
\ '  / /| |  / // ,<  / __/ /  |/ / /_/ /|// ___/ | / // // /|_/ /   ',
\ ' / ___ |_/ // /| |/ /___/ /|  / __  /  (__  )| |/ // // /  / /    ',
\ '/_/  |_/___/_/ |_/_____/_/ |_/_/ /_/  /____/ |___/___/_/  /_/     ',
\ '                                                                  ',
\ '       [Author:AikenHong 2021]                          ',
\ '       [Talk is Cheap, Show me the Code]                 ',
\ '       [@Github: https://github.com/aikenh]               ',
\ '       [@Blogs: https://aikenh.github.io/about/]          ',
\ '',
\]

"  Inherit those random queto
let g:startify_custom_header =
            \ startify#pad(g:ascii + startify#fortune#boxed())

" 列表显示长度
let g:startify_files_number=7

" 设置书签
let g:startify_bookmarks = [
            \ '~/workspace/Blogs/SUMMARY.md',
            \ '~/workspace/script/shvt.sh',
            \ '~/workspace/LeetCode/offerx.cpp',
            \ '~/workspace/AikenPipeline/main.py',
            \ '~/.config/nvim/init.vim',
            \]

" 过滤列表
let g:startify_skiplist = [
            \ '\.vimgolf',
            \ '^/tmp',
            \ '/project/.*/documentation',
            \ '\.js'
            \ ]

"}}}

" add header for py,cpp,sh{{{
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.md exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "# File Name: ".expand("%"))
        call append(line("."), "# Author: AikenHong")
        call append(line(".")+1, "# mail: h.aiken.970@gmail.com")
        call append(line(".")+2, "# Created Time: ".strftime("%c"))
        call append(line(".")+3, "")
    endif
    if &filetype == 'cpp'
        call setline(1, "/*")
        call append(line("."), "# File Name: ".expand("%"))
        call append(line(".")+1, "# Author: AikenHong")
        call append(line(".")+2, "# mail: h.aiken.970@gmail.com")
        call append(line(".")+3, "# Created Time: ".strftime("%c"))
        call append(line(".")+4, " */")
        call append(line(".")+5, " ")
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "#include <algorithm>")
        call append(line(".")+8, "#include <vector>")
        call append(line(".")+9, "#include <stack>")
        call append(line(".")+10, "#include <queue>")
        call append(line(".")+11, "#include <list>")
        call append(line(".")+12, "#include <map>")
        call append(line(".")+13, "#include <cmath>")
        call append(line(".")+14, "#include <set>")
        call append(line(".")+15, "")
        call append(line(".")+16, "using namespace std;")
        call append(line(".")+17, "")
        call append(line(".")+18, "int main()")
        call append(line(".")+19, "{")
        call append(line(".")+20, "    ")
        call append(line(".")+21, "    ")
        call append(line(".")+22, "    return 0;")
        call append(line(".")+23, "}")
    endif
    if &filetype == 'python'
        call setline(1, "\"\"\"")
        call append(line("."), "# File Name: ".expand("%"))
        call append(line(".")+1, "# Author: AikenHong")
        call append(line(".")+2, "# mail: h.aiken.970@gmail.com")
        call append(line(".")+3, "# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\"\"\"")
        call append(line(".")+5, "")
    endif
    if &filetype == 'markdown'
        set nonu
        call setline(1,"#")
        call append(line("."), "")
        call append(line(".")+1, "@Author: AikenHong2022")
        call append(line(".")+2, "@mail: h.aiken.970@gmail.com")
        call append(line(".")+3, "@Time: ".strftime("%c"))
        call append(line(".")+4, "@Purpose: ")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunction
" }}}

" Coc extensions List {{{
" coc-vimlsp
" coc-syntax
" coc-snippets
" coc-highlight
" coc-git
" coc-yaml
" coc-sh
" coc-pyright
" coc-markdownlint
" coc-json
" coc-jedi
" coc-cmake
" coc-clangd
" }}}

" Todo and its Lua{{{
set rtp+=.
runtime plugin/plenary.vim

nnoremap ,,x :luafile %<CR>
lua << EOF
require("todo-comments").setup {
    }
EOF
" }}}
" End of my Nvim Configuration
