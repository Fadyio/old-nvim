<div align="center">
  <img alt="Logo" src="https://github.com/Fadyio/Fadyio.com/blob/main/public/static/logo.svg" height="200"/>
</div>

<p align="center">
  <a href="https://github.com/Fadyio/nvim/stargazers">
    <img
      alt="Stargazers"
      src="https://img.shields.io/github/stars/Fadyio/nvim?style=for-the-badge&logo=starship&color=c678dd&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Fadyio/nvim/issues">
    <img
      alt="Issues"
      src="https://img.shields.io/github/issues/Fadyio/nvim?style=for-the-badge&logo=gitbook&color=f0c062&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
  <a href="https://github.com/Fadyio/nvim/contributors">
    <img
      alt="Contributors"
      src="https://img.shields.io/github/contributors/Fadyio/nvim?style=for-the-badge&logo=opensourceinitiative&color=abcf84&logoColor=d9e0ee&labelColor=282a36"
    />
  </a>
    <a href="https://github.com/Fadyio/nvim">
    <img src="https://img.shields.io/github/repo-size/Fadyio/nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" alt="Repo Size">
  </a>

  <img src="https://img.shields.io/github/last-commit/Fadyio/nvim?&style=for-the-badge&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" alt="Last Commit">
</p>



# Screenshot
![Screenshot](./assets/Nvim1.png)
![Screenshot](./assets/Nvim2.png)
![Screenshot](./assets/Nvim3.png)
![Screenshot](./assets/Nvim4.png)

This is my NeoVim config (for version 0.7 and greater).

* Autocompletion
* Highlighting
* Navigation
    * Find definition/declaration/implementation...
    * Find all references (of variables, methods, classes...)
    * Jump cursor focus forward/backward in time
    * Project tree view (NvimTree)
    * Switch between tabs
* Searching
    * Search by file name
    * Search by file contents
    * Search through NeoVim's help
* Refactoring (code actions)
    * Rename (variable, method, class...)
    * Automatically import
    * Simplify code
    * Infer type info
* Diagnostics
    * Show errors/warnings/hints/info
    * Diagnostic panel
    * Integration with status line
* Git
    * Highlight edited lines in number column
    * Navigate between hunks (changes)
    * Stage/unstage hunks
    * Preview old code
    * Status line integration
* Misc
    * Special start page
    * Indent guide lines
    * Motions for surrounding characters (brackets, parentheses...)
    * Easy commenting out code
    * Pretty status line
    * Default colorscheme
    * Enabled mouse integration
    * Keymappings for 10 finger typing on Slovene keyboard
## Backup your NeoVim config before install this one.

## Installation
1. Download this repo
```bash
git clone https://github.com/Fadyio/nvim
```
2. Put the contents of this repo where NeoVim can find them. On Linux this is most likely `$HOME/.config/nvim`,
Otherwise check the output of `:lua print(vim.fn.stdpath('data'))`.
3. Open NeoVim and let it install LazyNvim and all the dependencies (ignore the errors).
4. Open NeoVim again and wait for nvim-treesitter to install all of its dependencies (ignore the errors).

If you're updating an existing config and you're facing some issues,
I would recommend that you remove the contents of *data* folder and retry the installation. (It has helped me in the past)

## Icons
Icons and other special characters are used all around the config to give NeoVim a prettier look.
However, your terminal will not display these icons correctly unless it uses the correct font.

Install one of the icon fonts listed [here](https://www.nerdfonts.com/). Just follow their instructions for your specific OS.
After installation is complete, don't forget to configure your terminal to start using the new font.
Each terminal does this differently, so be sure to checkout [Arch Wiki](https://wiki.archlinux.org/) if you run into any troubles.


## License

<p align="center"><a href="https://github.com/fadyio/Nvim/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>

Copyright (c) 2025 [@Fadyio.com](https://fadyio.com).
