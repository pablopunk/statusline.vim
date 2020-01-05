# VIM Statusline for COC.NVIM

> Minimal plugin that creates a nice and simple statusbar

![creenshot](https://raw.githubusercontent.com/pablopunk/statusline.vim/master/screenshot.png)

- Current mode (and different coloring for each one)
- Git branch and status
- File and attributes (read only, modified...)
- Current line git-blame
- File type
- Current line and column
- File navigation percentage

## Install

Requires:

- [coc.nvim](https://github.com/neoclide/coc.nvim) with `coc-git` plugin.
- Some kind of [Nerd font](https://github.com/ryanoasis/nerd-fonts/) for the powerline symbols.

I use [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'pablopunk/statusline.vim'
```

## Custom colors

If you want to use custom colors override this values in your `.vimrc`:

```viml
let g:statusline_color_n = '#8854d0' " Normal mode
let g:statusline_color_i = '#22a6b3' " Insert mode
let g:statusline_color_v = '#3867d6' " Visual mode
let g:statusline_color_c = '#fc5c65' " Command mode
```

## Related

* [Better find command for vim](https://github.com/pablopunk/better-find.vim)
* [Native sidebar for vim](https://github.com/pablopunk/native-sidebar.vim)
* [Transparent vim](https://github.com/pablopunk/transparent.vim)
* [My dotfiles](https://github.com/pablopunk/dotfiles)
