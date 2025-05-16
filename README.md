# ng-switch.nvim

A simple Neovim plugin to quickly switch between Angular component files (TypeScript, HTML, stylesheets, and spec files) with custom commands.

> **Inspired by [infinity1207/angular2-switcher](https://github.com/infinity1207/angular2-switcher)**

## Features

- Jump between `.ts`, `.html`, `.spec.ts`, and style files (`.scss`, `.css`, `.sass`, `.less`) for Angular components.
- Optionally open target files in a vertical split.
- Customizable style file extensions and split behavior.

## Installation

Use your favorite plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "grantwforsythe/ng-switch.nvim",
  -- defaults
  opts = {
      is_vsplit = false, -- Set to true to open files in a vertical split
      style_formats = { "scss", "css", "sass", "less" }, -- Order of style extensions to check
  },
  keys = {
    { "<leader>nh", "<cmd>NgSwitchHTML<CR>", desc = "Switch to HTML file", noremap = true, silent = true },
    { "<leader>nt", "<cmd>NgSwitchTS<CR>", desc = "Switch to TypeScript file", noremap = true, silent = true },
    { "<leader>ns", "<cmd>NgSwitchSpec<CR>", desc = "Switch to Spec file", noremap = true, silent = true },
    { "<leader>nc", "<cmd>NgSwitchCSS<CR>", desc = "Switch to Style file", noremap = true, silent = true },
  }
}
```
