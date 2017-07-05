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
	if g:insert_debugger_language == 'ruby'
		exe "normal Orequire 'pry'; binding.pry\e^"
	elseif g:insert_debugger_language == 'php'
		exe "normal Oeval(\\Psy\\sh());\e^"
	endif
endfunction

function! InsertDebuggerBlockFnRuby(start, end)
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

function! InsertDebuggerBlockFnPhp(start, end)
	let selection_start = getpos("'<")
	let selection_end = getpos("'>")

	exe "normal \e"
	exe "normal '<"
	exe "normal Otry {\e=="

	exe "normal '>"
	exe "normal o} catch (\\Exception $e) {\e=="
	exe "normal oeval(\\Psy\\sh());\e=="
	exe "normal o}\e=="

	exe "normal gv==\e"
endfunction

function! InsertDebuggerBlockFn(start, end)
	if g:insert_debugger_language == 'ruby'
		call InsertDebuggerBlockFnRuby(a:start, a:end)
	elseif g:insert_debugger_language == 'php'
		call InsertDebuggerBlockFnPhp(a:start, a:end)
	endif
endfunction

com! -nargs=0 -range=% InsertDebugger :call InsertDebuggerFn()
com! -nargs=0 -range=% InsertDebuggerBlock :call InsertDebuggerBlockFn(<line1>, <line2>)
