local vim=vim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup({function()
  use {'wbthomason/packer.nvim',opt=true}
-- utility{{{
  use {'kyazdani42/nvim-web-devicons'}
  use {'lewis6991/impatient.nvim'}
  use {'nathom/filetype.nvim'}
  use {'tjdevries/astronauta.nvim'}
  use {'antoinemadec/FixCursorHold.nvim',
    config = function() require 'my_plugins.FixCursorHold' end,}
  use {'dstein64/vim-startuptime',cmd='StartupTime'}
  use {'vim-jp/vimdoc-ja',event = 'BufReadPost'}
--}}}

-- colorschemes{{{
  use {'rafi/awesome-vim-colorschemes',opt=true}
--}}}

-- interface{{{
--use { 'dstein64/nvim-scrollview', after = colorscheme,
--   config = function() require 'my_plugins.nvim-scrollview' end }
  use {'rcarriga/nvim-notify', event = "BufReadPost"}
  use {'edluffy/specs.nvim', event = "BufReadPost",
    config = function() require 'my_plugins.specs' end }
  use {'rinx/nvim-minimap', cmd = {'MinimapOpen'}}
  use {'itchyny/vim-cursorword',event = 'BufReadPost',}
  use { 't9md/vim-quickhl', event = "BufReadPost",
	 config = function() require 'my_plugins.vim-quickhl' end,}
  use {'glepnir/indent-guides.nvim' ,event = 'BufReadPost',}
  use {'mhinz/vim-signify',event = 'BufReadPost',}
  use {'chentau/marks.nvim',event = 'BufReadPost',
	 config = function() require 'my_plugins.marks' end,}
  use {'nvim-lualine/lualine.nvim' ,
     requires = {'kyazdani42/nvim-web-devicons'},
	 config = function() require 'my_plugins.lualine' end,}
  use { 'kdheepak/tabline.nvim',
    config = function() require 'my_plugins.tabline' end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'} }
  use {'kevinhwang91/nvim-hlslens',event = 'BufReadPost',
    config = function() require 'my_plugins.hlslens' end,}
  use {'petertriho/nvim-scrollbar',event = 'BufReadPost',
    after = 'nvim-hlslens',
	config = function() require 'my_plugins.nvim-scrollbar' end,}
--}}}

-- useful func{{{
  use {'kana/vim-smartchr', event = "BufReadPost",
    config = function() require 'my_plugins.vim-smartchr' end,}
  use {'mhinz/vim-sayonara', cmd='Sayonara' }
  use {'kraxli/vim-renamer',cmd='Renamer'}
  use {'tpope/vim-surround',event = 'InsertEnter',}
  use {'thinca/vim-qfreplace',cmd = 'Qfreplace',}
  use {'junegunn/vim-easy-align',}
  use {'simeji/winresizer',cmd='WinResizerStartResize',}
  use {'b3nj5m1n/kommentary',event = 'BufReadPost',
    config = function() require 'my_plugins.kommentary' end,}
  use{'PHSix/faster.nvim', event = 'BufReadPost *',
      config = function() require 'my_plugins.faster' end,}
 use {'unblevable/quick-scope', event = "BufReadPost",
    config = function() require 'my_plugins.quick-scope' end,}
  use {'rhysd/clever-f.vim',event = 'BufReadPost',
    config = function() require 'my_plugins.clever-f' end,}
  use {'phaazon/hop.nvim',event = 'BufReadPost',config='v1',
	config = function() require 'my_plugins.hop' end,}
--}}}

----{{{
--  use {'thinca/vim-quickrun',event = 'BufReadPost',
--	 config = function() require 'my_plugins.quickrun' end,
--     requires = {'Shougo/vimproc.vim'},}
--  use {'osyo-manga/vim-watchdogs',
--	 config = function() require 'my_plugins.watchdogs' end,
--     requires = {'osyo-manga/shabadou.vim',
--                 'Shougo/vimproc.vim'},}

-- quickfixのエンコードよくわからん
  use {'tweekmonster/braceless.vim', ft={'python'},
    config = function() require 'my_plugins.braceless' end,}
--  use {'neomake/neomake',  ft={'seq'},
--    config = function() require 'my_plugins.neomake' end,}
  use {'skywind3000/asyncrun.vim',event = 'BufReadPost',
    config = function() require 'my_plugins.asyncrun' end,}
  use {'mh21/errormarker.vim',
    after = 'asyncrun.vim',
    config = function() require 'my_plugins.errormarker' end,}
--use {'tpope/vim-dispatch',
--  config = function() require 'my_plugins.vim-dispatch' end,}
--use {'kassio/neoterm',
--  config = function() require 'my_plugins.neoterm' end,}
--}}}

  use {'tpope/vim-fugitive',event = 'BufReadPost',
	 config = function() require 'my_plugins.fugitive' end,}
  use {'jsfaint/gen_tags.vim',event = 'BufReadPost',
    --cond = function() return vim.fn.executable('ctags') == 1 end,
	config = function() require 'my_plugins.gen_tags' end,}
  use {'majutsushi/tagbar',event = 'BufReadPost',
    config = function() require 'my_plugins.tagbar' end,}
  use {'voldikss/vim-translator',event = 'BufReadPost',
    config = function() require 'my_plugins.vim-translator' end,}
  use {'skanehira/preview-markdown.vim',ft={'markdown'},
    config = function() require 'my_plugins.preview-markdown' end,}
  use {'mechatroner/rainbow_csv',ft={'csv'},}
  use { 'windwp/nvim-autopairs', event = "BufReadPost",
    config = function() require 'my_plugins.nvim-autopairs' end, }

-- fuzzy finder{{{
  use {'nvim-telescope/telescope.nvim',
     config = function() require('my_plugins.telescope').setup() end,
     requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},}
  use {'kyazdani42/nvim-tree.lua',
     requires = {'kyazdani42/nvim-web-devicons',opt=true},
	 config = function() require 'my_plugins.nvim-tree' end,}
--}}}

-- treesitter{{{
  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate',}
  use {'p00f/nvim-ts-rainbow',
	config = function() require 'my_plugins.nvim-ts-rainbow' end,}
  use {'nvim-treesitter/playground',
	config = function() require 'my_plugins.playground' end,}
--}}}

-- lsp{{{
  use {'onsails/lspkind-nvim'             ,
    event="BufReadPost",
    config = function() require 'my_plugins.lspkind-nvim' end,}
  use {'neovim/nvim-lspconfig' ,
    after = 'cmp-nvim-lsp',
    config = function() require 'my_plugins.lspconfig' end,}
  use {'williamboman/nvim-lsp-installer',
    after = {'nvim-lspconfig', 'lsp_signature.nvim'},
    config = function() require 'my_plugins.lsp-installer' end,}
  use { 'ray-x/lsp_signature.nvim',
    after = 'nvim-lspconfig',
    config = function() require 'my_plugins.lsp-signature' end,}
  use {'weilbith/nvim-lsp-smag', after = 'nvim-lspconfig'}
  use {'j-hui/fidget.nvim', after = 'nvim-lspconfig',
    config = function() require 'my_plugins.fidget' end,}
--}}}

--lsp ui{{{
  use { 'tami5/lspsaga.nvim',
    after = 'nvim-lsp-installer',
    config = function() require 'my_plugins.lspsaga' end }
  use { 'folke/trouble.nvim',
    requires = {'folke/lsp-colors.nvim'},
    after = 'nvim-lsp-installer',
    config = function() require 'my_plugins.trouble' end,}
--}}}

-- completion{{{
  use { 'hrsh7th/nvim-cmp', event = 'InsertEnter',
    after = { 'vim-vsnip', },
    requires = {
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'onsails/lspkind-nvim'},
      {'hrsh7th/vim-vsnip'},
      {'windwp/nvim-autopairs',},--, after= 'nvim-cmp'},
      {'hrsh7th/cmp-omni', after = 'nvim-cmp'},
      {'f3fora/cmp-spell', after = 'nvim-cmp'},
      {'hrsh7th/cmp-vsnip',after = 'nvim-cmp'},
      {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'},
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
      {'hrsh7th/cmp-path', after = 'nvim-cmp'},
      {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
      {'ray-x/cmp-treesitter', after = 'nvim-cmp'},
      {'tzachar/cmp-tabnine',after = 'nvim-cmp',run='powershell ./install.ps1'},
      {'quangnguyen30192/cmp-nvim-tags',after = 'nvim-cmp'}
    },
    config = function() require 'my_plugins.nvim-cmp' end,
  }
--}}}

-- candidate
  --use { 'VonHeikemen/fine-cmdline.nvim',
  --  requires = { 'MunifTanjim/nui.nvim' },
  --  config = function() require 'my_plugins.fine-cmdline' end }

-- others{{{
  use {'~/seq.vim'}
  use {'lark-parser/vim-lark-syntax'}
--}}}
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
