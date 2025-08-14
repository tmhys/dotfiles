-- autocmds.lua (refactor)
local group = vim.api.nvim_create_augroup("vimrc_core", { clear = true })

-- ① Filetype を Lua で拡張（autocmd ではなく、起動時1回で完了）
vim.filetype.add({
  extension = {
    seq = "seq",
    s   = "seq",
    h   = "seq",
    tbl = "seq",
  },
})

-- ② Quickfix: grep系の後に自動で開く（loclist/quickfix を1つに統合）
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = group,
  pattern = { "make", "grep", "grepadd", "vimgrep", "vimgrepadd", "lmake", "lgrep", "lgrepadd", "lvimgrep", "lvimgrepadd" },
  desc = "Open quickfix/location list automatically",
  callback = function(args)
    -- args.match でコマンド種別が取れる（l* は loclist）
    if args.match:sub(1,1) == "l" then
      vim.cmd("lwindow")      -- ← ここは `lwin` ではなく `lwindow`
    else
      vim.cmd("cwindow")
    end
  end,
})

-- ③ リサイズで等分
vim.api.nvim_create_autocmd("VimResized", {
  group = group,
  desc = "Equalize splits after resizing",
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- ④ 相対行番号の自動切替（ウィンドウローカルで最少イベントのみ）
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  group = group,
  desc = "Disable rnu when insert or leaving window",
  callback = function()
    vim.wo.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  group = group,
  desc = "Enable rnu when normal mode & focus window",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
})

-- ⑤ Yank ハイライト（pattern/once は既定値でOK）
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight on yank",
  callback = function()
    pcall(vim.highlight.on_yank, { higroup = "Visual", timeout = 200 })
  end,
})

-- ⑥ gitcommit: insert開始 + スペルON（ローカルに）
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "gitcommit",
  desc = "Start insert and enable spell for gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.cmd("startinsert")
  end,
})

-- ⑦ fold 関連: filetypeごとにローカル設定
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "lua", "vim", "toml" },
  desc = "Use marker folds for config-like files",
  callback = function()
    vim.opt_local.foldmethod = "marker"
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "python",
  desc = "Python-specific errorformat & foldmethod",
  callback = function()
    vim.opt_local.errorformat = [[%A\ \ File\ \"%f\"\,\ line\ %l%.%#,%Z%[%^\ ]%\@=%m]]
    vim.opt_local.foldmethod = "indent"
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "json",
  desc = "Folding for JSON",
  callback = function()
    -- Treesitter があるなら expr 折り畳みの方が高速/安定
    if pcall(require, "nvim-treesitter") then
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt_local.foldmethod = "syntax"
    end
  end,
})

-- ⑧ BufReadPost: マーク全消し（必要なら残す。重くはないが副作用はある）
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "Clear all marks on buffer read (optional)",
  callback = function()
    vim.cmd("delmarks!")
  end,
})

-- ⑨ BufWritePre: クリーニングを1つに統合 + 条件付き実行
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  desc = "Trim trailing spaces / squeeze blank lines / optional retab",
  callback = function(args)
    -- バッファ種別・巨大ファイルをスキップ
    local bt = vim.bo[args.buf].buftype
    if bt ~= "" and bt ~= "acwrite" then return end
    if not vim.bo[args.buf].modifiable then return end
    -- 1MB超 or 50k行超は重い処理をスキップ
    local ok, stat = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    local big = ok and stat and stat.size and stat.size > 1024 * 1024
    local linecount = vim.api.nvim_buf_line_count(args.buf)
    if big or linecount > 50000 then
      -- 巨大ファイルは末尾スペースだけ軽く削る
      vim.cmd([[keeppatterns %s/\s\+$//ge]])
      return
    end

    -- 末尾スペース削除
    vim.cmd([[keeppatterns %s/\s\+$//ge]])
    -- 連続空行を最大2行に圧縮（あなたの元の置換を簡潔化）
    vim.cmd([[keeppatterns %s/\n\{3,}/\r\r/ge]])
    -- 末尾の空白行を削除
    vim.cmd([[keeppatterns %s#\($\n\s*\)\+\%$##ge]])

    -- retab は重いので条件付き（expandtab かつ タブがあるときのみ）
    if vim.bo[args.buf].expandtab and vim.fn.search("\t", "nw") > 0 then
      vim.cmd("retab")
    end
  end,
})
