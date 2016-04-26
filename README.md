# Insert-Debugger

## About
This plugin inserts a debugger statement at the current position or alternatively wraps a visual selection with exception handling+debugger statement.

## Installation

I recommend [Vundle](https://github.com/VundleVim/Vundle.vim)

    Plugin 'codegourmet/insert-debugger'

## Usage

Setup the method via your preferred keybinding inside `.vimrc`:

    nmap <Leader>i :InsertDebugger<CR>
    vmap <Leader>i :InsertDebuggerBlock<CR>

## Settings

### g:insert_debugger_language
At the moment, only ruby is supported.

    let g:insert_debugger_language = 'ruby'

Default: 'ruby'

## Contributing
If you think anything's missing or buggy please drop me a line or a pull request.

## TODO

vim docs

## License
MIT
