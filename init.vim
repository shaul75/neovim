" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-github.nvim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-fzf-writer.nvim'
    " file tree
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'ray-x/lsp_signature.nvim'
    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer' " easily install language servers.
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    " Plug 'glepnir/lspsaga.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    " A completion engine plugin for neovim written in Lua
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'
    Plug 'olimorris/onedarkpro.nvim'

    " fancy start screen
    Plug 'mhinz/vim-startify'
    " Auto-Resizing Focused Splits/Windows for Neovim
    Plug 'beauwilliams/focus.nvim'

    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

    Plug 'rafi/awesome-vim-colorschemes'
    " tabs/buffers
    Plug 'akinsho/bufferline.nvim'
    " rails
    Plug 'tpope/vim-rails'
    Plug 'vim-test/vim-test'

    Plug 'tpope/vim-surround' " easily manipulate lines with brackets/parenthesis/quotes
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-dispatch'
    Plug 'junegunn/vim-easy-align'
    Plug 'sindrets/diffview.nvim'
    Plug 'folke/zen-mode.nvim'

    Plug 'tpope/vim-eunuch' " Vim sugar for the UNIX shell commands that need it the most
    Plug 'tpope/vim-fugitive' " popular git plugin
    Plug 'tpope/vim-commentary'
    Plug 'tanvirtin/vgit.nvim'
    " Plug 'onsails/lspkind-nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'

    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

colorscheme onedarkpro

set completeopt=menu,menuone,preview

" basic settings
syntax on
set number
set hidden
set relativenumber
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters
set nocompatible
set incsearch        " do incremental searching
set visualbell
set expandtab
set tabstop=2
set ruler
set smartindent
set shiftwidth=2
set hlsearch
" set virtualedit=all

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
set mouse=a  " mouse support
set clipboard^=unnamed,unnamedplus
set termguicolors

lua <<EOF
  require('vgit').setup()
  require("cmp_config")
  require("lsp_config")
  require("telescope_config")
  require('lualine_config')
  require("focus").setup {}
  -- require("statusbar")
  -- require("completion")
  require("treesitter")
  require("zen-mode").setup {}
  require("bufferline").setup{}
  require("nvim_tree_config")
  require("trouble").setup {}
  require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
  }

  vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', '^if', '^while', '^for', 'block'}
  vim.o.updatetime = 300
  vim.o.incsearch = false
  vim.wo.signcolumn = 'yes'
EOF

" make test commands execute using dispatch.vim
" let test#strategy = "dispatch"
:autocmd FileType qf wincmd L
let g:test#preserve_screen = 1
let test#strategy = "neovim"
let g:loaded_ruby_provider = 0
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


exec 'source ~/.config/nvim/keymap.vim'


