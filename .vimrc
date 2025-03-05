" 基础设置
set nocompatible        " 禁用 vi 兼容模式
filetype on             " 文件类型检测
syntax on               " 语法高亮
set encoding=utf-8      " 使用 UTF-8 编码

" 界面设置
set number              " 显示行号
set relativenumber      " 显示相对行号（普通模式）
set cursorline          " 高亮当前行
set showcmd             " 显示输入命令
set title               " 在窗口标题显示文件名
set laststatus=2        " 总是显示状态栏
set scrolloff=5         " 垂直滚动时保留 5 行上下文
set sidescrolloff=5     " 水平滚动时保留 5 列上下文
set display+=lastline   " 尽量显示长行的最后部分

" 搜索设置
set hlsearch            " 高亮搜索结果
set incsearch           " 实时搜索
set ignorecase          " 搜索忽略大小写
set smartcase           " 包含大写时使用精确搜索

" 缩进设置
set autoindent          " 自动缩进
set smartindent         " 智能缩进
set expandtab           " 将 Tab 转换为空格
set tabstop=4           " Tab 显示为 4 个空格
set shiftwidth=4        " 自动缩进使用 4 个空格
set softtabstop=4       " 退格键一次删除 4 个空格

" 编辑设置
set backspace=indent,eol,start  " 更自然的退格行为
set wrap                " 自动换行
set linebreak           " 在单词边界换行（不拆分单词）
set textwidth=80        " 自动换行宽度
set formatoptions+=j    " 删除注释前缀时自动连接行
set autoread            " 文件被外部修改时自动重新加载

" 性能优化
set lazyredraw          " 减少重绘频率
set ttyfast             " 优化终端渲染

" 文件处理
set nobackup            " 禁用备份文件
set noswapfile          " 禁用交换文件
set undofile            " 启用持久撤销
set undodir=~/.vim/undodir  " 撤销文件存储目录（需要手动创建）

" 快捷键映射
let mapleader = " "     " 设置 leader 键为空格

" 清除搜索高亮
nnoremap <silent> <leader><space> :nohlsearch<CR>

" 快速跳转到行首/行尾（插入模式）
inoremap <C-a> <Home>
inoremap <C-e> <End>

" 保持选择块后调整缩进
vnoremap < <gv
vnoremap > >gv

" 文件类型特定设置
augroup filetype_settings
    autocmd!
    " Markdown 文件使用软换行
    autocmd FileType markdown setlocal wrap linebreak nolist
    " 文本文件使用 2 空格缩进
    autocmd FileType text,markdown setlocal tabstop=2 shiftwidth=2
    " 自动关闭补全预览窗口
    autocmd CompleteDone * pclose
augroup END

" ==== Esc 键优化 ====
" 插入模式快速返回普通模式
inoremap jk <Esc>
inoremap kj <Esc>

" 可视模式也使用相同映射
vnoremap jk <Esc>
" vnoremap kj <Esc>

filetype plugin indent on
