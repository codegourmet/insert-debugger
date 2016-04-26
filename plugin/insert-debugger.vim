" configuration example:
" nmap <Leader>p :call InsertDebugger()<CR>

if exists('g:loaded_insert_debugger')
	finish
endif
let g:loaded_insert_debugger = 1

if ! exists("g:insert_debugger_language")
	let g:insert_debugger_language = 'ruby'
end

function! InsertDebugger()
	echo('NYI')
endfunction
