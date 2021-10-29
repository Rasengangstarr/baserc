set ts=4 sw=4
syntax on " Syntax highlighting
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set shiftwidth=4
set nocompatible
filetype plugin on

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
call plug#end()


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


function! SearchForLines(pattern1, pattern2)
    let line1 = search(a:pattern1)
    let line2 = search(a:pattern2)
    return getbufline(bufnr('%'), line1, line2)
endfunction

function! Strip(input_string)
	return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction


function! Pad(s,amt)
    return a:s . repeat(' ',a:amt - len(a:s))
endfunction

function Meow()
	echom "Meow!"
endfunction

function Vimhabits()
	 filetype indent off 
	
	 let lines = SearchForLines('/vimhabits', 'vimhabits/')
	 let numDays = matchstr(lines[0], '\[\(.\{-}\)\]')[1]
	 echom numDays
	 let c = 1

	 "delete the markup
	 let startLine = search("/vimhabits") 
	 let endLine = search ("vimhabits/")
	 echom startLine
	 echom endLine
	 let delLine = endLine - startLine + 1
	 call cursor(startLine, 1)
	 while delLine > 0
		 d
		 let delLine -= 1
	 endwhile

	 " Write some Headers
	 let headers = "| Day | "
	 while c < len(lines) - 1
		let headers = headers . Strip(lines[c]) . " | "
		let c += 1
	 endwhile
	 exe "normal! a" . headers . "\n\<Esc>"	
	 "call append(line(startLine + 1), headers)
	 
	 let c2 = 0
	 
	 while c2 < numDays
		let c = 1 
		let thisLine = "| ". (c2+1) ."   |"
		while c < len(lines) - 1
			let thisLine = thisLine . Pad('', len(Strip(lines[c]))+2) . "|"
			let c += 1
		endwhile
		let c2 += 1
	 	exe "normal! a" . thisLine . "\n\<Esc>"	
	    		
		"call append(line(startLine + c2 + 1), thisLine)
	 endwhile
	 filetype indent on 
	 
endfunction
