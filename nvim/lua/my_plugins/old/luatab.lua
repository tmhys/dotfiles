require('luatab').setup{
    tabline = function()
        local line = ''
        for i = 1, vim.fn.tabpagenr('$'), 1 do
            line = line .. require'luatab'.helpers.cell(i)
        end
        line = line .. '%#TabLineFill#%='
        return line
    end
--    title = function() return '' end,
--    modified = function() return '' end,
--    windowCount = function() return '' end,
--    devicon = function() return '' end,
--    separator = function() return '' end,
}

vim.opt.showtabline = 2
