-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\thtom\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\thtom\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\thtom\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\thtom\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\thtom\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\astronauta.nvim",
    url = "https://github.com/tjdevries/astronauta.nvim"
  },
  ["auto-ctags.vim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26my_plugins.auto-ctags\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\auto-ctags.vim",
    url = "https://github.com/soramugi/auto-ctags.vim"
  },
  ["awesome-vim-colorschemes"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\awesome-vim-colorschemes",
    url = "https://github.com/rafi/awesome-vim-colorschemes"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22my_plugins.barbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24my_plugins.clever-f\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer\\after\\plugin\\cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline\\after\\plugin\\cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lua\\after\\plugin\\cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-tags"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-tags\\after\\plugin\\cmp_nvim_tags.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags"
  },
  ["cmp-path"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path\\after\\plugin\\cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-tabnine\\after\\plugin\\cmp-tabnine.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-treesitter"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-treesitter\\after\\plugin\\cmp_treesitter.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    after_files = { "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-vsnip\\after\\plugin\\cmp_vsnip.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["faster.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22my_plugins.faster\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\faster.nvim",
    url = "https://github.com/PHSix/faster.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19my_plugins.hop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-guides.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\indent-guides.nvim",
    url = "https://github.com/glepnir/indent-guides.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26my_plugins.kommentary\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28my_plugins.lspkind-nvim\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23my_plugins.lualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21my_plugins.marks\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\marks.nvim",
    url = "https://github.com/chentau/marks.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-cmdline", "cmp-nvim-lua", "cmp-path", "cmp-tabnine", "cmp-treesitter", "cmp-vsnip", "cmp-buffer", "cmp-nvim-tags" },
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24my_plugins.nvim-cmp\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29my_plugins.lsp-installer\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25my_plugins.lspconfig\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-minimap"] = {
    commands = { "MinimapOpen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-minimap",
    url = "https://github.com/rinx/nvim-minimap"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25my_plugins.nvim-tree\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26my_plugins.playground\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["preview-markdown.vim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 my_plugins.preview-markdown\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\preview-markdown.vim",
    url = "https://github.com/skanehira/preview-markdown.vim"
  },
  ["seq.vim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\seq.vim",
    url = "C:\\Users\\thtom\\seq.vim"
  },
  ["shabadou.vim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\shabadou.vim",
    url = "https://github.com/osyo-manga/shabadou.vim"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21my_plugins.specs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\specs.nvim",
    url = "https://github.com/edluffy/specs.nvim"
  },
  tagbar = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22my_plugins.tagbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\tagbar",
    url = "https://github.com/majutsushi/tagbar"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25my_plugins.telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23my_plugins.trouble\frequire\0" },
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-cursorword"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-cursorword",
    url = "https://github.com/itchyny/vim-cursorword"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24my_plugins.fugitive\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-qfreplace"] = {
    commands = { "Qfreplace" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-qfreplace",
    url = "https://github.com/thinca/vim-qfreplace"
  },
  ["vim-quickrun"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24my_plugins.quickrun\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-renamer"] = {
    commands = { "Renamer" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-renamer",
    url = "https://github.com/kraxli/vim-renamer"
  },
  ["vim-signify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-translator"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30my_plugins.vim-translator\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-watchdogs"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25my_plugins.watchdogs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-watchdogs",
    url = "https://github.com/osyo-manga/vim-watchdogs"
  },
  ["vimdoc-ja"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vimdoc-ja",
    url = "https://github.com/vim-jp/vimdoc-ja"
  },
  ["vimproc.vim"] = {
    loaded = true,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vimproc.vim",
    url = "https://github.com/Shougo/vimproc.vim"
  },
  winresizer = {
    commands = { "WinResizerStartResize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\thtom\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\winresizer",
    url = "https://github.com/simeji/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: playground
time([[Config for playground]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26my_plugins.playground\frequire\0", "config", "playground")
time([[Config for playground]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23my_plugins.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29my_plugins.lsp-installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25my_plugins.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23my_plugins.trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28my_plugins.lspkind-nvim\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25my_plugins.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25my_plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd vim-vsnip ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Renamer lua require("packer.load")({'vim-renamer'}, { cmd = "Renamer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Qfreplace lua require("packer.load")({'vim-qfreplace'}, { cmd = "Qfreplace", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapOpen lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WinResizerStartResize lua require("packer.load")({'winresizer'}, { cmd = "WinResizerStartResize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType seq ++once lua require("packer.load")({'vim-watchdogs'}, { ft = "seq" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'preview-markdown.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'vim-surround'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'clever-f.vim', 'vimdoc-ja', 'hop.nvim', 'tagbar', 'indent-guides.nvim', 'vim-cursorword', 'marks.nvim', 'vim-fugitive', 'vim-translator', 'kommentary', 'vim-quickrun', 'vim-signify', 'auto-ctags.vim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'barbar.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'faster.nvim', 'specs.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
