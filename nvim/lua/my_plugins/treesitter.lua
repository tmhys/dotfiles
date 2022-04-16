require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
    --'lua',
    --'ruby',
    --'toml',
      'c_sharp',
      'seq',
    }
  },
  ensure_installed = { "typescript", "vim", "lua", "python", "toml" },
--ensure_installed = 'all',
}
