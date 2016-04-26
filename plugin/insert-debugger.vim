" configuration example:
" nmap <Leader>p :call InsertDebugger()<CR>

if exists('g:loaded_insert_debugger')
	" finish
endif
let g:loaded_insert_debugger = 1

if ! exists("g:insert_debugger_language")
	let g:insert_debugger_language = 'ruby'
end

function! InsertDebuggerFn()
	exe "normal Orequire 'pry'; binding.pry\e^"
endfunction

function! InsertDebuggerBlockFn(start, end)
	let selection_start = getpos("'<")
	let selection_end = getpos("'>")

	exe "normal \e"
	exe "normal '<"
	exe "normal Obegin\e=="

	exe "normal '>"
	exe "normal orescue\e=="
	exe "normal orequire 'pry'; binding.pry\e=="
	exe "normal oend\e=="

	exe "normal gv==\e"
endfunction

com! -nargs=0 -range=% InsertDebugger :call InsertDebuggerFn()
com! -nargs=0 -range=% InsertDebuggerBlock :call InsertDebuggerBlockFn(<line1>, <line2>)
