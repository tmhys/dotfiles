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
			timeout = 600,
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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		vim.cmd([[set et]])
		vim.cmd([[ret]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	group = groupname,
	pattern = "*",
	callback = function()
		vim.cmd([[delmarks!]])
	end,
	once = false,
})

--Quickfixウィンドウグレップで自動で開く
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
	group = groupname,
	pattern = { "make", "grep", "grepadd", "vimgrep", "vimgrepadd" },
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

-- fold関連設定
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = { "lua", "vim", "toml" },
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

-- fast.nvim + lualineちらつき対策
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = groupname,
	pattern = "json",
	callback = function()
		vim.cmd([[
        setlocal foldmethod=syntax
    ]])
	end,
	once = false,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = groupname,
	pattern = { "*.seq", "*.s", "*.h", "*.tbl" },
	callback = function()
		vim.cmd([[ setfiletype seq ]])
	end,
	once = false,
})

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

---- alpha nvimで起動時間を表示するように変更
---- このautocmd自体は残しておかないとalpha nvimに表示できない
--if vim.fn.has("vim_starting") == 1 then
--    vim.g.startuptime = vim.fn.reltime()
--    vim.api.nvim_create_autocmd({ "VimEnter" }, {
--        group = groupname,
--        pattern = { "*" },
--        callback = function()
--            vim.cmd([[
--        let g:startuptime = reltime(g:startuptime)
--        redraw
--        echomsg printf('startuptime: %fms', reltimefloat(g:startuptime) * 1000)
--    ]])
--        end,
--        once = true,
--    })
--end
