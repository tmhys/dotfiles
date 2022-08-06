local null_ls = require("null-ls")

-- $XDG_CONFIG_HOME/cspell
local cspell_config_dir = '~/.config/cspell'
-- $XDG_DATA_HOME/cspell
local cspell_data_dir = '~/.local/share/cspell'
local cspell_files = {
  config = vim.call('expand', cspell_config_dir .. '/cspell.json'),
  dotfiles = vim.call('expand', cspell_config_dir .. '/dotfiles.txt'),
  vim = vim.call('expand', cspell_data_dir .. '/vim.txt.gz'),
  user = vim.call('expand', cspell_data_dir .. '/user.txt'),
}

-- vim�������Ȃ���΃_�E�����[�h
if vim.fn.filereadable(cspell_files.vim) ~= 1 then
  local vim_dictionary_url = 'https://github.com/iamcco/coc-spell-checker/raw/master/dicts/vim/vim.txt.gz'
  io.popen('curl -fsSLo ' .. cspell_files.vim .. ' --create-dirs ' .. vim_dictionary_url)
end

-- ���[�U�[�������Ȃ���΍쐬
if vim.fn.filereadable(cspell_files.user) ~= 1 then
    io.popen('mkdir -p ' .. cspell_data_dir)
    io.popen('touch ' .. cspell_files.user)
end

-- https://zenn.dev/kawarimidoll/articles/2e99432d27eda3
local cspell_append = function(opts)
  local word = opts.args
  if not word or word == "" then
    -- �������Ȃ����cword���擾
    word = vim.call('expand', '<cword>'):lower()
  end

  -- bang�̗L���ŕۑ���𕪊�
  local dictionary_name = opts.bang and 'dotfiles' or 'user'

  -- shell��echo�R�}���h�Ŏ����t�@�C���ɒǋL
  io.popen('echo ' .. word .. ' >> ' .. cspell_files[dictionary_name])

  -- �ǉ������P�ꂨ��ю�����\��
  vim.notify(
    '"' .. word .. '" is appended to ' .. dictionary_name .. ' dictionary.',
    vim.log.levels.INFO,
    {}
  )

  -- cspell�������[�h���邽�߁A���ݍs���X�V���Ă����߂�
  if vim.api.nvim_get_option_value('modifiable',{}) then
    vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
    vim.api.nvim_command('silent! undo')
  end
end

vim.api.nvim_create_user_command(
  'CSpellAppend',
  cspell_append, { nargs = '?', bang = true }
)

local cspell_custom_actions = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = {},
  generator = {
    fn = function(_)
      -- ���݂̃J�[�\���ʒu
      local lnum = vim.fn.getcurpos()[2] - 1
      local col = vim.fn.getcurpos()[3]

      -- ���ݍs�̃G���[���b�Z�[�W�ꗗ
      local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

      -- �J�[�\���ʒu��cspell�̌x�����o�Ă��邩�T��
      local word = ''
      local regex = '^Unknown word %((%w+)%)$'
      for _, v in pairs(diagnostics) do
        if v.source == "cspell" and
            v.col < col and col <= v.end_col and
            string.match(v.message, regex) then
	  -- ���������ꍇ�A�P��𒊏o
          word = string.gsub(v.message, regex, '%1'):lower()
          break
        end
      end

      -- �x����������Ȃ���ΏI��
      if word == '' then
        return
      end

      -- cspell_append���Ăяo��action�̃��X�g��ԋp
      return {
        {
          title = 'Append "' .. word .. '" to user dictionary',
          action = function()
            cspell_append({ args = word })
          end
        },
        {
          title = 'Append "' .. word .. '" to dotfiles dictionary',
          action = function()
            cspell_append({ args = word, bang = true })
          end
        }
      }
    end
  }
}

-- null_ls�ɓo�^
null_ls.register(cspell_custom_actions)


local sources = {
    null_ls.builtins.formatting.stylua.with({
        condition = function()
            return vim.fn.executable("stylua") > 0
        end,
    }),
    null_ls.builtins.formatting.black.with({
        condition = function()
            return vim.fn.executable("black") > 0
        end,
    }),
    null_ls.builtins.formatting.isort.with({
        condition = function()
            return vim.fn.executable("isort") > 0
        end,
    }),
    null_ls.builtins.formatting.prettier.with({
        condition = function()
            return vim.fn.executable("prettier") > 0
        end,
    }),
    null_ls.builtins.diagnostics.editorconfig_checker.with({
        condition = function()
            return vim.fn.executable("ec") > 0
        end,
    }),
    null_ls.builtins.diagnostics.cspell.with({
        diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["WARN"]
        end,
        condition = function()
            return vim.fn.executable("cspell") > 0
        end,
    -- �N�����ɐݒ�t�@�C���ǂݍ���
    -- �ǂݍ��ނƂ��܂������Ȃ��Ȃ�
        -- extra_args = { '--config', cspell_files.config }
        extra_args = { '--config','~/.config/cspell/cspell.json'}
    }),
    null_ls.builtins.formatting.markdownlint.with({
        condition = function()
            return vim.fn.executable("markdownlint") > 0
        end,
    }),
}


-- local lsp_formatting = function(bufnr)
local lsp_formatting = function()
    vim.lsp.buf.formatting_sync()
    -- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    -- vim.lsp.buf.format({
    -- 	filter = function(client)
    -- 		return client.name ~= "tsserver"
    -- 	end,
    -- 	bufnr = bufnr,
    -- })
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
            once = false,
        })
    end
end

null_ls.setup({
    sources = sources,
    on_attach = on_attach,
})
