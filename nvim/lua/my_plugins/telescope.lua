vim.api.nvim_command([[packadd telescope-file-browser.nvim]])
require("telescope").load_extension("file_browser")

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
                ["<esc>"] = actions.close,
                --["jj"] = actions.close
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        preview = {
            hide_on_startup = true,
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "%.dll", "%.exe", "%.qm", "%.dat" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        --borderchars = {
        --  --style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        --  { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        --  prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        --  results = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        -- review = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        --},
        --    borderchars = {
        --    prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
        --    results = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
        -- review = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
        --  },
        --borderchars = { '═', '║', "=", "║", "╔", "╗", "╝", "╚" },
        --borderchars = { '─', '│', '─', '│', '+', '+', '+', '+' },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
        tags = {
            theme = "dropdown",
        },
        oldfiles = {
            theme = "dropdown",
        },
        help_tags = {
            theme = "dropdown",
        },
        quickfix = {
            theme = "dropdown",
        },
        colorscheme = {
            theme = "dropdown",
        },
        -- file_browser = {
        --     theme = "dropdown",
        -- },
    },
})
