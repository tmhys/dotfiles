local vim=vim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup({function()
-- utility
  use {'wbthomason/packer.nvim',opt=true}
  use {'lewis6991/impatient.nvim'}
  use {'nathom/filetype.nvim'}
  use {'tjdevries/astronauta.nvim'}
  use {'dstein64/vim-startuptime',cmd='StartupTime'}
  use {'vim-jp/vimdoc-ja',event = 'BufReadPost'}
-- colorschemes
  use {'rafi/awesome-vim-colorschemes',opt=true}
-- interface
  use {'itchyny/vim-cursorword',event = 'BufReadPost',}
  use {'glepnir/indent-guides.nvim' ,event = 'BufReadPost',}
  use {'mhinz/vim-signify',event = 'BufReadPost',}
  use {'chentau/marks.nvim',event = 'BufReadPost',
	 config = function() require('my_plugins.marks') end,}
  use {'nvim-lualine/lualine.nvim' ,
     requires = {'kyazdani42/nvim-web-devicons'},
	 config = function() require('my_plugins.lualine') end,}
  use {'romgrk/barbar.nvim', event = 'BufWinEnter',
     requires = {'kyazdani42/nvim-web-devicons'},
     config = function() require('my_plugins.barbar') end,}
  --use {'kevinhwang91/nvim-hlslens',event = 'BufReadPost',
  --  config = function() require('my_plugins.hlslens') end,}

-- useful func
  use {'kraxli/vim-renamer',cmd='Renamer'}
  use {'tpope/vim-surround',event = 'InsertEnter',}
  use {'thinca/vim-qfreplace',cmd = 'Qfreplace',}
  use {'junegunn/vim-easy-align',}
  --use {'jiangmiao/auto-pairs',event = 'InsertEnter',}
  use {'simeji/winresizer',cmd='WinResizerStartResize',}
  use {'b3nj5m1n/kommentary',event = 'BufReadPost',
    config = function() require('my_plugins.kommentary') end,}
  use{'PHSix/faster.nvim', event = 'VimEnter *',
      config = function() require('my_plugins.faster') end,}
  use {'rhysd/clever-f.vim',event = 'BufReadPost',
    config = function() require('my_plugins.clever-f') end,}
  use {'phaazon/hop.nvim',event = 'BufReadPost',config='v1',
	config = function() require('my_plugins.hop') end,}
  use {'thinca/vim-quickrun',event = 'BufReadPost',
	 config = function() require('my_plugins.quickrun') end,
     requires = {'Shougo/vimproc.vim'},}
  use {'osyo-manga/vim-watchdogs',
	 config = function() require('my_plugins.watchdogs') end,
     requires = {'osyo-manga/shabadou.vim',
                 'Shougo/vimproc.vim'},}
  use {'tpope/vim-fugitive',event = 'BufReadPost',
	 config = function() require('my_plugins.fugitive') end,}
  use {'soramugi/auto-ctags.vim',event = 'BufReadPost',
    config = function() require('my_plugins.auto-ctags') end,}
  use {'majutsushi/tagbar',event = 'BufReadPost',
    config = function() require('my_plugins.tagbar') end,}
  use {'voldikss/vim-translator',event = 'BufReadPost',
    config = function() require('my_plugins.vim-translator') end,}
  use {'skanehira/preview-markdown.vim',ft={'markdown'},
    config = function() require('my_plugins.preview-markdown') end,}

-- fuzzy finder
  use {'nvim-telescope/telescope.nvim',
	 config = function() require('my_plugins.telescope').setup() end,
     requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},}
  use {'kyazdani42/nvim-tree.lua',
     requires = {'kyazdani42/nvim-web-devicons',opt=true},
	 config = function() require('my_plugins.nvim-tree') end,}

  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate',}
  use {'nvim-treesitter/playground',
	config = function() require('my_plugins.playground') end,}

-- lsp (順番注意)
  use {'onsails/lspkind-nvim'             ,
    config = function() require('my_plugins.lspkind-nvim') end,}
  --use {'glepnir/lspsaga.nvim'             ,
  --  config = function() require('my_plugins.lspsaga') end,}
  use {'folke/trouble.nvim'             ,
    config = function() require('my_plugins.trouble') end,}
  use {'williamboman/nvim-lsp-installer',
    requires={'neovim/nvim-lspconfig'},
    config = function() require('my_plugins.lsp-installer') end,}
  use {'neovim/nvim-lspconfig' ,
    config = function() require('my_plugins.lspconfig') end,}

-- completion
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    after = {
      'vim-vsnip',
    },
    requires = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'onsails/lspkind-nvim'},
      {'hrsh7th/vim-vsnip'},
      {'windwp/nvim-autopairs',},--, after= 'nvim-cmp'},
      {'hrsh7th/cmp-vsnip',after = 'nvim-cmp'},
      {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'},
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
      {'hrsh7th/cmp-path', after = 'nvim-cmp'},
      {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
      {'ray-x/cmp-treesitter', after = 'nvim-cmp'},
      {'tzachar/cmp-tabnine',after = 'nvim-cmp',run='powershell ./install.ps1'},
      {'quangnguyen30192/cmp-nvim-tags',after = 'nvim-cmp'}
    },
    config = function() require('my_plugins.nvim-cmp') end,
  }

-- candidate
  --use {'SmiteshP/nvim-gps'}
  --use {'Pocco81/HighStr.nvim'}
  --use {'myusuf3/numbers.vim',
  --  cmd = {'NumbersToggle', 'NumbersOnOff'},
  --}
  use {'edluffy/specs.nvim',
    event = "VimEnter",
    config = function() require 'my_plugins.specs' end }
  use {'rinx/nvim-minimap', cmd = {'MinimapOpen'}}

-- others
  use {'~/seq.vim'} --, ft={'seq'}} -- なぜかファイルタイプを指定するとうまく反映されない
  use {'kyazdani42/nvim-web-devicons'}
end,

config = {
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({border = 'single'})
    end
  }
}}
)
