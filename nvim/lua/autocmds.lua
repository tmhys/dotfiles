local groupname = "vimrc_vimrc"

vim.api.nvim_create_augroup(groupname, { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = { "qf" },
	callback = function()
		vim.wo.wrap = true
		vim.cmd([[wincmd J]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = { "gitcommit" },
	callback = function()
		vim.cmd([[startinsert]])
		vim.cmd([[setlocal spell]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = (vim.fn.hlexists("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "Visual"),
			timeout = 500,
		})
	end,
	once = false,
})

local remove_dust = function()
  local cursor = vim.fn.getpos(".")
  vim.cmd([[keeppatterns %s/\s\+$//ge]])
  vim.cmd([[keeppatterns %s/\n\{4,}/\r\r\r/ge]])
  vim.cmd([[keeppatterns %s#\($\n\s*\)\+\%$##ge]])
  vim.fn.setpos(".", cursor)
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = groupname,
	pattern = "*",
	callback = remove_dust,
	once = false,
})

--Quickfixウィンドウグレップで自動で開く
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
	group = groupname,
    pattern = { "lmake", "lgrep", "lgrepadd", "lvimgrep", "lvimgrepadd" },
	callback = function()
        vim.cmd([[cwindow]])
	end,
	once = false,
})
vim.api.nvim_create_autocmd({ "QuickfixCmdPost" }, {
	group = groupname,
	pattern = { "lmake", "lgrep", "lgrepadd", "lvimgrep", "lvimgrepadd" },
	callback = function()
		vim.cmd([[lwin]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = groupname,
	pattern = "*",
	callback = function()
        vim.cmd([[wincmd=]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = { "vim", "toml" },
	callback = function()
        vim.cmd([[setlocal foldmethod=marker]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = "python",
	callback = function()
        vim.cmd([[
            setlocal errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
            setlocal foldmethod=indent
        ]])
	end,
	once = false,
})

--{{{filetype関連　いる？
--vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--	group = groupname,
--	pattern = { "*.py" },
--	callback = function()
--        vim.cmd([[ setfiletype python ]])
--	end,
--	once = false,
--})
--
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = groupname,
	pattern = { "*.seq","*.s","*.h","*.tbl" },
	callback = function()
        vim.cmd([[ setfiletype seq ]])
	end,
	once = false,
})
--
--vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--	group = groupname,
--	pattern = { "*.vim" },
--	callback = function()
--        vim.cmd([[ setfiletype vim ]])
--	end,
--	once = false,
--})
--
--vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--	group = groupname,
--	pattern = { "*.lua" },
--	callback = function()
--        vim.cmd([[ setfiletype lua ]])
--	end,
--	once = false,
--})
--
--vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--	group = groupname,
--	pattern = { "*.toml" },
--	callback = function()
--        vim.cmd([[ setfiletype toml ]])
--	end,
--	once = false,
--})
--}}}

--人の設定からコピペ{{{
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		if vim.o.nu and vim.fn.mode() ~= "i" then
			vim.o.rnu = true
		end
	end,
	once = false,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		if vim.o.nu then
			vim.o.rnu = false
		end
	end,
	once = false,
})
--}}}

--startuptime を以下の形式に変換したい
if vim.fn.has('vim_starting')  == 1 then
    vim.g.startuptime = vim.fn.reltime()
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
    	group = groupname,
    	pattern = { "*" },
    	callback = function()
        vim.cmd([[
            let g:startuptime = reltime(g:startuptime)
            redraw
            echomsg printf('startuptime: %fms', reltimefloat(g:startuptime) * 1000)
        ]])
    	end,
    	once = true,
    })
end


-- 以下は残骸
--vim.cmd([[
--""augroup reload_vimrc
--""    autocmd!
--""    autocmd BufWritePost $HOME/vimfiles/*,$HOME/vimfiles/init/*.vim,$HOME/vimrc/init/*.vim,$MYVIMRC
--""				\:nested source $MYVIMRC
--""				\|if has('gui_running') |source $MYGVIMRC |endif
--""				\|if exists('g:loaded_webdevicons') | call webdevicons#refresh() | endif
--""				\|redraw
--""				\|echomsg printf('VIMRC has reloaded (%s).', strftime('%c'))
--""augroup END
--]])
