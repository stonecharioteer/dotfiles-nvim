local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init({
  git = {
    clone_timeout = 120,
  },
})

local plugins = {
  -- packer
  { "wbthomason/packer.nvim" },
  -- color schemes
  { "kvrohit/substrata.nvim" },
  { "rafamadriz/neon" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },
  -- enhancements
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("config.telescope").setup()
    end,
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp").setup()
    end,
  },
  { "ray-x/lsp_signature.nvim" },
  -- completion
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.cmp").setup()
    end,
  },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("config.tabout").setup()
    end,
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    config = function()
      require("config.treesitter").setup()
    end,
  },
  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("config.toggleterm").setup()
    end,
  },
  {
    "jose-elias-alvarez/buftabline.nvim",
    config = function()
      require("config.buftabline").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "famiu/feline.nvim",
    config = function()
      require("config.statusline").setup()
    end,
  },
  -- essentials
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-sleuth" },
  { "kvrohit/tasks.nvim" },
  {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("config.autopairs").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require("config.formatter").setup()
    end,
  },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  { "fladson/vim-kitty" },
}

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
