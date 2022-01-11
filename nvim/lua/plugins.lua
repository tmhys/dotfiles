local vim=vim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup({function()
  use {'wbthomason/packer.nvim',opt=true}
  use {'lewis6991/impatient.nvim'}
  use {"nathom/filetype.nvim"}
  use {'tjdevries/astronauta.nvim'}--for keymap in lua file
  use {'mopp/layoutplugin.vim'}
-- colorschemes
  use {'rafi/awesome-vim-colorschemes',opt=true}
-- setting
  use {'kraxli/vim-renamer',cmd="Renamer"}
  use {'dstein64/vim-startuptime',cmd='StartupTime'}
  use {'itchyny/vim-cursorword',event = "BufReadPost",}
  use {'glepnir/indent-guides.nvim' ,event = "BufReadPost",}
  use {'tpope/vim-surround',event = "InsertEnter",}
  use {'thinca/vim-qfreplace',cmd = "Qfreplace",}
  use {'mhinz/vim-signify',event = "BufReadPost",}
  use {'kshenoy/vim-signature',event = "BufReadPost",}
  use {'jiangmiao/auto-pairs',event = "InsertEnter *",}
  use {'junegunn/vim-easy-align',cmd = "easyalign",}
  use {'simeji/winresizer',cmd="WinResizerStartResize",}
  use {'kdheepak/tabline.nvim',event = "BufReadPost",
    config = function() require("my_plugins.tabline") end,}
  --use {'kevinhwang91/nvim-hlslens',event = "BufReadPost",
  --  config = function() require("my_plugins.hlslens") end,}
  use{ "PHSix/faster.nvim", event = "BufReadPost",
      config = function() require("my_plugins.faster") end,}
  use {'rhysd/clever-f.vim',event = "BufReadPost",config = function() require("my_plugins.clever-f") end,}
  use {'phaazon/hop.nvim',event = "BufReadPost",config="v1",
	config = function() require("my_plugins.hop") end,}
  use {'thinca/vim-quickrun',event = "BufReadPost",
	 config = function() require("my_plugins.quickrun") end,
     requires = {"Shougo/vimproc.vim"},}

  use {'osyo-manga/vim-watchdogs', ft={'seq'},
	 config = function() require("my_plugins.watchdogs") end,
     requires = {"osyo-manga/shabadou.vim",
                 "Shougo/vimproc.vim"},}

  use {'tpope/vim-fugitive',event = "BufReadPost",
	 config = function() require("my_plugins.fugitive") end,}
--nvim
  use {"nvim-telescope/telescope.nvim",
     --cmd="Telescope",
	 config = function() require("my_plugins.telescope").setup() end,
     requires = { { "nvim-lua/popup.nvim"}, { "nvim-lua/plenary.nvim"}},}
  use {"nvim-lualine/lualine.nvim" ,
	 config = function() require("my_plugins.lualine") end,}
  --use {"romgrk/barbar.nvim", event = "BufWinEnter",
  --  config = function() require("my_plugins.barbar") end,}
  use {"kyazdani42/nvim-tree.lua",
	config = function() require("my_plugins.nvim-tree") end,}
  use {"nvim-treesitter/nvim-treesitter", branch = "0.5-compat", run = ":TSUpdate",}
  use {'nvim-treesitter/playground',
	config = function() require("my_plugins.playground") end,}
  --use {"p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter", after = "nvim-treesitter",
  --  config = function() require("my_plugins.rainbow") end,}
  use {'neovim/nvim-lspconfig' , 'williamboman/nvim-lsp-installer',
    config = function() require("my_plugins.lspconfig") end,}
  use {'onsails/lspkind-nvim'             ,
    config = function() require("my_plugins.lspkind-nvim") end,}
  --use {'glepnir/lspsaga.nvim'             ,
  --  config = function() require("my_plugins.lspsaga") end,}
  use {'folke/trouble.nvim'             ,
    config = function() require("my_plugins.trouble") end,}
  use { "hrsh7th/nvim-cmp",
    requires = {
         {"hrsh7th/cmp-nvim-lsp",after = "nvim-cmp" },
         {"ray-x/cmp-treesitter",after = "nvim-cmp"},
         {"hrsh7th/cmp-vsnip",after = "nvim-cmp"},
         {"hrsh7th/vim-vsnip",after = "nvim-cmp"},
         {"hrsh7th/cmp-nvim-lua",after = "nvim-cmp"},
         { "hrsh7th/cmp-buffer",after = "nvim-cmp" },
         {"hrsh7th/cmp-path",after = "nvim-cmp"},
         {"quangnguyen30192/cmp-nvim-tags",after = "nvim-cmp"},
         {"tzachar/cmp-tabnine",after = "nvim-cmp",run='powershell ./install.ps1'}--,requires='hrsh7th/nvim-cmp'},
    },
    config = function() require("my_plugins.nvim-cmp") end,
    event = "InsertEnter *",}
  --use {'~/seq.vim'} --, ft={'seq'}} -- なぜかファイルタイプを指定するとうまく反映されない
  use { 'soramugi/auto-ctags.vim',event = "BufReadPost",
    config = function() require("my_plugins.auto-ctags") end,}
  use { 'majutsushi/tagbar',event = "BufReadPost",
    config = function() require("my_plugins.tagbar") end,}
  use {'vim-jp/vimdoc-ja',event = "BufReadPost"}
  use {'voldikss/vim-translator',event = "BufReadPost",
    config = function() require("my_plugins.vim-translator") end,}
  use { "kyazdani42/nvim-web-devicons" ,}
end,

config = {
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single'})
    end
  }
}}
)
