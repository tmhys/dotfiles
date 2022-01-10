local M = {}
M.setup = function()
  my_dashboard = {
    active = true,
    search_handler = "telescope",
    custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    },

    custom_section = {
      a = {
        description = { "  Find File          " },
        command = "Telescope find_files",
      },
      b = {
        description = { "  Recently Used Files" },
        command = "Telescope oldfiles",
      },
       c = {
         description = { "  Load Last Session " },
         command = "SessionLoad",
       },
      c = {
        description = { "  Find Word           " },
        command = "Telescope live_grep",
      },
      d = {
        description = { "  Settings           " },
        command = ":e ~/AppData/Local/nvim/init.lua",
      },
    },

  }

  vim.g.dashboard_disable_at_vimenter = 0

  vim.g.dashboard_custom_header = my_dashboard.custom_header

  vim.g.dashboard_default_executive = my_dashboard.search_handler

  vim.g.dashboard_custom_section = my_dashboard.custom_section

  vim.cmd "let packages = len(globpath('$HOME/AppData/Local/nvim-data/site/pack/packer/start', '*', 0, 1))"

  vim.api.nvim_exec(
    [[
    let g:dashboard_custom_footer = ['Loaded '..packages..' plugins ']
    autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
    autocmd FileType dashboard set nonumber
    autocmd BufLeave dashboard set number

]],
    false
  )

end

return M
