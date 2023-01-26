require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        disable = {
            --'lua',
            --'ruby',
            --'toml',
            --'c_sharp',
            -- "seq",
        },
    },
    indent = {
        disable = {
            "seq",
        },
    },
    rainbow = {
        disable = {
            -- "seq",
        },
    },
    incremental_selection = {
        disable = {
            "seq",
        },
    },
    -- nvimGPS = {
    --     disable = {
    --         "seq",
    --     },
    -- },
    --ensure_installed = { "vim", "lua", "python", "toml" },
    --ensure_installed = { "vim", "python", "toml", "lua" ,"seq"},
    ensure_installed = { "vim", "python", "toml", "lua" },
    -- ensure_installed = 'all',
})
