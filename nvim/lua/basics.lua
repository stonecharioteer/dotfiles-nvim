-- setup all the basic stuff you'd setup even in Vim.
-- Anything that is generic and not plugin-specific.
-- set the locale for all the symbols to work well.
-- NOTE: You will need to
-- install said-locale when you're setting up your machine.
vim.cmd([[language en_US.utf-8]])
-- turn off the swp file
vim.opt.swapfile = false
-- maintain an undofile that helps record all undos
vim.opt.undofile = true
-- show absolute line numbers
vim.opt.number = true
-- show relative line numbers
vim.opt.relativenumber = true
-- show statusbar only when there are more than 2 windows
vim.opt.laststatus = 2
-- turn off the backup
vim.opt.backup = false
-- allow resizing the splits with a mouse cursor
vim.opt.mouse = "a"
-- disable the ruler
vim.opt.ruler = false

-- jump to the right split when creating a new one
vim.opt.splitright = true
-- jump to the below split when creating a new one
vim.opt.splitbelow = true
-- ignore case when searching
vim.opt.ignorecase = true
-- do not highlight search matches
vim.opt.hlsearch = false
-- how often to update the swapfile
vim.opt.updatetime = 250
-- minimum number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 5
-- minimum number of characters to keep when side-scrolling
vim.opt.sidescrolloff = 5
-- setup autocomplete options. Protip: use C-n in insert mode to see a popup for autocomplete
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
-- add `c` to the shortmess option so that it doesn't give 
vim.opt.shortmess = vim.o.shortmess .. "c"
-- show the mode on the last line
vim.opt.showmode = false
-- always show the signcolumn that displays debugging and other valid information about the file a
vim.opt.signcolumn = "yes"
-- disable visual wrap
vim.opt.wrap = false
--  show a line where the cursor is
vim.opt.cursorline = true
-- highlight these columns
vim.opt.colorcolumn = "80,100,120"

-- indentation related options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.textwidth = 100

-- forgot why I added this here.
-- vim.opt.format = vim.o.format .. "t"

-- indentline
vim.g.indent_blankline_setColors = 0
vim.g.indent_blankline_defaultGroup = "SpecialKey"
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_filetype_exclude = { "help", "fugitive", "packer" }
