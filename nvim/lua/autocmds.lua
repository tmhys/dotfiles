-- autocmds.lua (refactor)
local group = vim.api.nvim_create_augroup("vimrc_core", { clear = true })

-- �@ Filetype �� Lua �Ŋg���iautocmd �ł͂Ȃ��A�N����1��Ŋ����j
vim.filetype.add({
  extension = {
    seq = "seq",
    s   = "seq",
    h   = "seq",
    tbl = "seq",
  },
})

-- �A Quickfix: grep�n�̌�Ɏ����ŊJ���iloclist/quickfix ��1�ɓ����j
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  group = group,
  pattern = { "make", "grep", "grepadd", "vimgrep", "vimgrepadd", "lmake", "lgrep", "lgrepadd", "lvimgrep", "lvimgrepadd" },
  desc = "Open quickfix/location list automatically",
  callback = function(args)
    -- args.match �ŃR�}���h��ʂ�����il* �� loclist�j
    if args.match:sub(1,1) == "l" then
      vim.cmd("lwindow")      -- �� ������ `lwin` �ł͂Ȃ� `lwindow`
    else
      vim.cmd("cwindow")
    end
  end,
})

-- �B ���T�C�Y�œ���
vim.api.nvim_create_autocmd("VimResized", {
  group = group,
  desc = "Equalize splits after resizing",
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- �C ���΍s�ԍ��̎����ؑցi�E�B���h�E���[�J���ōŏ��C�x���g�̂݁j
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

-- �D Yank �n�C���C�g�ipattern/once �͊���l��OK�j
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight on yank",
  callback = function()
    pcall(vim.highlight.on_yank, { higroup = "Visual", timeout = 200 })
  end,
})

-- �E gitcommit: insert�J�n + �X�y��ON�i���[�J���Ɂj
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "gitcommit",
  desc = "Start insert and enable spell for gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.cmd("startinsert")
  end,
})

-- �F fold �֘A: filetype���ƂɃ��[�J���ݒ�
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
    -- Treesitter ������Ȃ� expr �܂��݂̕�������/����
    if pcall(require, "nvim-treesitter") then
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt_local.foldmethod = "syntax"
    end
  end,
})

-- �G BufReadPost: �}�[�N�S�����i�K�v�Ȃ�c���B�d���͂Ȃ�������p�͂���j
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "Clear all marks on buffer read (optional)",
  callback = function()
    vim.cmd("delmarks!")
  end,
})

-- �H BufWritePre: �N���[�j���O��1�ɓ��� + �����t�����s
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  desc = "Trim trailing spaces / squeeze blank lines / optional retab",
  callback = function(args)
    -- �o�b�t�@��ʁE����t�@�C�����X�L�b�v
    local bt = vim.bo[args.buf].buftype
    if bt ~= "" and bt ~= "acwrite" then return end
    if not vim.bo[args.buf].modifiable then return end
    -- 1MB�� or 50k�s���͏d���������X�L�b�v
    local ok, stat = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    local big = ok and stat and stat.size and stat.size > 1024 * 1024
    local linecount = vim.api.nvim_buf_line_count(args.buf)
    if big or linecount > 50000 then
      -- ����t�@�C���͖����X�y�[�X�����y�����
      vim.cmd([[keeppatterns %s/\s\+$//ge]])
      return
    end

    -- �����X�y�[�X�폜
    vim.cmd([[keeppatterns %s/\s\+$//ge]])
    -- �A����s���ő�2�s�Ɉ��k�i���Ȃ��̌��̒u�����Ȍ����j
    vim.cmd([[keeppatterns %s/\n\{3,}/\r\r/ge]])
    -- �����̋󔒍s���폜
    vim.cmd([[keeppatterns %s#\($\n\s*\)\+\%$##ge]])

    -- retab �͏d���̂ŏ����t���iexpandtab ���� �^�u������Ƃ��̂݁j
    if vim.bo[args.buf].expandtab and vim.fn.search("\t", "nw") > 0 then
      vim.cmd("retab")
    end
  end,
})
