" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on     " 语法高亮
endif

"colorscheme ron        " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下
colorscheme ron

" detect file type
filetype on
filetype plugin on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif
"
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"  "have Vim load indentation rules and plugins according to the detected filetype
"  filetype plugin indent on
"endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.高亮显示匹配的括号
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching 自动缩进
set incsearch		" Incremental search
set nu
set hlsearch
set cursorline
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set laststatus=2
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set ma			" Make a buffer modifiable



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'python'
		exec '!time python %'
	elseif &filetype == 'sh'
		:!time bash %
	endif
endfunc 






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompeleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=/home/wyj/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf = 0
nnoremap <C-]> :w<CR>:YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-l> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let mapleader = ","
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0
let g:ycm_error_syymbol = '>>'
let g:ycm_warning_symbol= '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <C-l> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_invoke_completion='<S-Space>'
let mainder = ","  " 这个leader就映射为逗号“，”
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:syntastic_cpp_compiler='g++' "support c++11
let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libc++' "set added c++11 support
let  g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:SuperTabClosePreviewOnPopupClose = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add comment in the head of code automatically 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


autocmd BufNewFile *.c, *.h, *.hpp, *.cpp, *.sh, *.py, Makefile exec ":call SetTitle()"

func SetComment()
	call setline(1,"/*================================================================") 
	call append(line("."), "*   ") 
	call append(line(".")+1, "*   Filename：".expand("%:t")) 
	call append(line(".")+2, "*   Author  ：Wang Yongjie")
	call append(line(".")+3, "*   Date    ：".strftime("%Y%m%d")) 
	call append(line(".")+4, "*   Email   ：yongjie.wang@ntu.edu.sg") 
	call append(line(".")+5, "*	  Discription：") 
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/") 
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc


func SetTitle()
	if &filetype == 'python'
		call setline(1, "\#	Filename	:	".expand("%"))
		call setline(2, "\#	Author		:	Wang Yongjie")
		call setline(3, "\# Email		:	yongjie.wang@ntu.edu.sg")
		call setline(4, "\#	Date		:	".strftime("%c"))
		call setline(5, "\# Description	:	")
		call setline(6, "")
	elseif &filetype == 'shell'
		call setline(1, "\#!/bin/bash")
		call setline(2, "\#	Filename	:	".expand("%"))
		call setline(3, "\#	Author		:	Wang Yongjie")
		call setline(4, "\# Email		:	yongjie.wang@ntu.edu.sg")
		call setline(5, "\#	Date		:	".strftime("%c"))
		call setline(6, "\# Description	:	")
		call setline(7, "")
	elseif &filetype == 'makefile'
		call setline(2, "\#	Filename	:	".expand("%"))
		call setline(3, "\#	Author		:	Wang Yongjie")
		call setline(4, "\# Email		:	yongjie.wang@ntu.edu.sg")
		call setline(5, "\#	Date		:	".strftime("%c"))
		call setline(6, "\# Description	:	")
		call setline(7, "")
	else
		call SetComment()
		if expand("%:e") == 'hpp' 
			call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
			call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
			call append(line(".")+12, "#ifdef __cplusplus") 
			call append(line(".")+13, "extern \"C\"") 
			call append(line(".")+14, "{") 
			call append(line(".")+15, "#endif") 
			call append(line(".")+16, "") 
			call append(line(".")+17, "#ifdef __cplusplus") 
			call append(line(".")+18, "}") 
			call append(line(".")+19, "#endif") 
			call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 

		elseif expand("%:e") == 'h' 
			call append(line(".")+10, "#pragma once") 

		elseif &filetype == 'c' 
			call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 

		elseif &filetype == 'cpp' 
			call append(line(".")+10, "#include \"".expand("%:t:r").".h\"") 
		endif
	endif
endfunc
