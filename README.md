# toggle-case.vim

Cycle between standard variable case formats with a single command.

## Usage

A single command is provided by this plugin:

    :ToggleCase

This command toggles the case of the variable under the cursor, cycling between:

- `camelCase`
- `CamelCaseWithInitialCapital`
- `snake_case`, and
- `ALL_CAPS_SNAKE_CASE`

For single-word variables, the rotation is simply between all lower case, all upper case, and capitalized. Leading underscores are always ignored.

By default `<Plug>ToggleCase` is bound to `<leader>tt`. You can override this by defining your own mapping with a line such as this in your `.vimrc`:

    nnoremap <leader>c <Plug>ToggleCase

A help file containing this information can be brought up in Vim with `:help toggle-case.txt`.

## Installation

With [Pathogen](https://github.com/tpope/vim-pathogen): `cd ~/.vim/bundle && git clone git://github.com/bhritchie/vim-toggle-case.git`.

With [Vundle](https://github.com/gmarik/Vundle.vim): add `Plugin 'bhritchie/vim-toggle-case'` to the list of Vundle plugins in your `.vimrc` and run `:PluginInstall`.

With [Plug-Vim](https://github.com/junegunn/vim-plug): add `Plug 'bhritchie/vim-toggle-case'` to the list of Plug in your `.vimrc` and run `:PlugInstall`.

Once installed, the plugin can be disabled by adding the following line to your `.vimrc` and restarting Vim:

    let g:loaded_toggle_case = 1

## License

[MIT](http://opensource.org/licenses/MIT).
