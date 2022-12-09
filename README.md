# README
 
**backlinks.nvim** is a neovim lua plugin that allows you to find all the files in
a given directory that back link to the current file. This can be useful for
managing and navigating large collections of files, such as with [vimwiki](https://github.com/vimwiki/vimwiki).

## Installation

To install the plugin, follow the instructions for your plugin manager of
choice.

## Configuration

The plugin supports the following configuration options:

```vim 
" Set search directory 
let g:backlinks_search_dir = "~/vimwiki"

" Set exclude patterns, default is none
let g:backlinks_exclude_pattern = "\/assets\/"
```

## Usage

To use the plugin, simply run the following command in neovim:

```
:lua require("backlinks").find_files_back_linked()
```

This will list all the files in the `backlinks_search_dir` that back link to
the current file.

To make it easier to use the plugin, you can add a keymap shortcut. For example,
you can add the following line to map the `<leader> b` key to the
`find_files_back_linked` function:

```lua
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  "<cmd>lua require('backlinks').find_files_back_linked()<cr>",
  { noremap = true, silent = true }
)
```

This will allow you to quickly run the `find_files_back_linked` function by
pressing `<leader>b` in normal mode. You can customize the keymap shortcut to use
any key combination that you prefer.
