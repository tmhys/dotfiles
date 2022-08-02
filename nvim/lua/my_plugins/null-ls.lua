local null_ls = require("null-ls")

local function file_exists(fname)
    local stat = vim.loop.fs_stat(vim.fn.expand(fname))
    return (stat and stat.type) or false
end

-- https://zenn.dev/kawarimidoll/articles/2e99432d27eda3
local cspell_append = function(opts)
    local word = opts.args
    if not word or word == "" then
        word = vim.call("expand", "<cword>"):lower()
    end

    local file = vim.fn.getcwd() .. "/.nvim/" .. "cspell.txt"
    io.popen("echo " .. word .. " >> " .. file)
    vim.notify('"' .. word .. '" is appended to ' .. file .. " dictionary.", vim.log.levels.INFO, {})

    if vim.api.nvim_get_option_value("modifiable", {}) then
        vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
        vim.api.nvim_command("silent! undo")
    end
end

vim.api.nvim_create_user_command("CSpellAppend", cspell_append, { nargs = "?", bang = true })

local cspell_custom_actions = {
    method = null_ls.methods.CODE_ACTION,
    filetypes = {},
    generator = {
        fn = function(_)
            local lnum = vim.fn.getcurpos()[2] - 1
            local col = vim.fn.getcurpos()[3]

            local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

            local word = ""
            local regex = "^Unknown word %((%w+)%)$"
            for _, v in pairs(diagnostics) do
                if v.source == "cspell" and v.col < col and col <= v.end_col and string.match(v.message, regex) then
                    word = string.gsub(v.message, regex, "%1"):lower()
                    break
                end
            end

            if word == "" then
                return
            end

            return {
                {
                    title = 'Append "' .. word .. '" to local dictionary',
                    action = function()
                        cspell_append({ args = word })
                    end,
                },
            }
        end,
    },
}
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
    -- null_ls.builtins.diagnostics.cspell.with({
    --     diagnostics_postprocess = function(diagnostic)
    --         diagnostic.severity = vim.diagnostic.severity["WARN"]
    --     end,
    --     condition = function()
    --         return vim.fn.executable("cspell") > 0
    --     end,
    -- }),
    null_ls.builtins.formatting.markdownlint.with({
        condition = function()
            return vim.fn.executable("markdownlint") > 0
        end,
    }),
}

if file_exists("./.nvim/local-null-ls.lua") then
    local local_null = dofile("./.nvim/local-null-ls.lua")
    sources = require("rc/utils").merge_lists(sources, local_null)
end

local lsp_formatting = function(bufnr)
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
