# toggle-case.vim

***THIS PLUGIN IS NOT YET COMPLETE***

Cycle between standard variable case formats with a single command.

## Usage

A single command is provided by this plugin:

    :ToggleCase

This command toggles the case of the variable under the cursor, cycling between:

- `camelCase`
- `CamelCaseWithInitialCapital`
- `snake_case`, and
- `ALL_CAPS_SNAKE_CASE`

For single-word variables, snake-case is left out of the cycle, since it would be the same as camel-case. Leading underscores are always ignored.

By default `:ToggleCase` is bound to `<leader>tt`. You can override this by defining your own mapping with a line such as this in your `.vimrc`:

    nnoremap <leader>c :ToggleCase<cr>

A help file containing this information can be brought up in Vim with `:help toggle-case.txt`.

## Installation

With [Pathogen](https://github.com/tpope/vim-pathogen): `cd ~/.vim/bundle && git clone git://github.com/bhritchie/toggle-case.git`.

With [Vundle](https://github.com/gmarik/Vundle.vim): add `Plugin 'bhritchie/toggle-case'` to the list of Vundle plugins in your `.vimrc` and run `:PluginInstall`.

Once installed, the plugin can be disabled by adding the follwing line to your `.vimrc` and restarting Vim:

	let g:loaded_toggle_case = 1

## License

[MIT](http://opensource.org/licenses/MIT).
