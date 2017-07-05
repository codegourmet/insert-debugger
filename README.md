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

    let g:insert_debugger_language = 'ruby'

Default: 'ruby'
Available: 'ruby', 'php'

### Setting language dependent on filetype

    autocmd FileType php let g:insert_debugger_language = 'php'
    autocmd FileType ruby let g:insert_debugger_language = 'ruby'

### Example for ruby

#### Before

```ruby
previous_line()
cursor_line()
```

#### After execution without selection

```ruby
previous_line()
require 'pry'; binding.pry
cursor_line()
```

#### After execution with visual selection

```ruby
begin
  previous_line()
  cursor_line()
rescue
  require 'pry'; binding.pry
end
```

### Example for php

#### Before

```php
previousLine();
cursorLine();
```

#### After execution without selection

```php
previousLine();
eval(\Psy\sh());
cursorLine();
```

#### After execution with visual selection

```php
try {
  previousLine();
  cursorLine();
} catch (Exception $e) {
  eval(\Psy\sh());
}
```

## Contributing
If you think anything's missing or buggy please drop me a line or a pull request.

## TODO

vim docs

## License
MIT
