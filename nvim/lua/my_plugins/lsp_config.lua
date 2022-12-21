return {
  lspconfig = {
    setup = function()
      local api = require("core.utils").api
      local palette = require "core.utils.palette" "nord"
      api.create_autocmd("ColorScheme", {
        group = api.create_augroup("lspconfig-colors", {}),
        pattern = "nord",
        callback = function()
          api.set_hl(0, "DiagnosticError", { fg = palette.red })
          api.set_hl(0, "DiagnosticWarn", { fg = palette.orange })
          api.set_hl(0, "DiagnosticInfo", { fg = palette.bright_cyan })
          api.set_hl(0, "DiagnosticHint", { fg = palette.bright_black })
          api.set_hl(0, "DiagnosticUnderlineError", { sp = palette.red, undercurl = true })
          api.set_hl(0, "DiagnosticUnderlineWarn", { sp = palette.orange, undercurl = true })
          api.set_hl(0, "DiagnosticUnderlineInfo", { sp = palette.bright_cyan, undercurl = true })
          api.set_hl(0, "DiagnosticUnderlineHint", { sp = palette.bright_black, undercurl = true })
          api.set_hl(0, "LspBorderTop", { fg = palette.border, bg = palette.dark_black })
          api.set_hl(0, "LspBorderLeft", { fg = palette.border, bg = palette.black })
          api.set_hl(0, "LspBorderRight", { fg = palette.border, bg = palette.black })
          api.set_hl(0, "LspBorderBottom", { fg = palette.border, bg = palette.dark_black })
        end,
      })
    end,

    config = function()
      local fn, uv, api = require("core.utils").globals()

      fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "��" })
      fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "��" })
      fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "��" })
      fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "��" })

      api.create_autocmd("LspAttach", {
        group = api.create_augroup("enable-lualine-lsp", {}),
        once = true,
        callback = function()
          require("modules.start.config.lualine").is_lsp_available = true
        end,
      })

      require("mason").setup {
        max_concurrent_installers = 12,
      }
      require("lsp_lines").setup()
      -- Use lsp_lines instead
      vim.diagnostic.config {
        virtual_text = {
          format = function(d)
            return ("%s (%s: %s)"):format(d.message, d.source, d.code)
          end,
        },
        virtual_lines = { only_current_line = true },
      }

      api.create_user_command("ShowLSPSettings", function()
        print(vim.inspect(vim.lsp.get_active_clients()))
      end, { desc = "Show LSP settings" })

      api.create_user_command("ReloadLSPSettings", function()
        vim.lsp.stop_client(vim.lsp.get_active_clients())
        vim.cmd.edit()
      end, { desc = "Reload LSP settings" })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        signs = true,
        -- Use lsp_lines instead
        virtual_text = false,
      })

      local lsp = require "lspconfig"
      local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities
      if ok then
        local orig = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities(orig)
      end
      local home_dir = function(p)
        return uv.os_homedir() .. (p or "")
      end
      local iterm2_dir = function(p)
        return home_dir "/.config/iterm2/AppSupport/iterm2env-72/versions/3.8.6/lib/" .. (p or "")
      end

      -- needed for sumneko_lua
      require("neodev").setup {}

      local server_configs = {
        clangd = {},
        cssls = {},
        dockerls = {},
        golangci_lint_ls = {},
        html = {},
        intelephense = {},
        jsonls = {},
        jsonnet_ls = {},
        marksman = {},
        metals = {},
        solargraph = {},
        sourcekit = {},
        teal_ls = {},
        terraformls = {},
        tsserver = {},
        vimls = {},
        vuels = {},
        yamlls = {},

        perlnavigator = {
          cmd = { "perlnavigator", "--stdio" },
          settings = {
            perlnavigator = {
              perlPath = "carmel exec -- perl",
              includePaths = { "lib", "local/lib/perl5" },
            },
          },
        },

        pyright = {
          settings = {
            python = {
              analysis = {
                extraPaths = {
                  home_dir(),
                  iterm2_dir "python38.zip",
                  iterm2_dir "python3.8",
                  iterm2_dir "python3.8/lib-dynload",
                  iterm2_dir "python3.8/site-packages",
                },
              },
            },
          },
        },

        denols = {
          init_options = {
            lint = true,
            unstable = true,
          },
        },

        bashls = {
          filetypes = { "sh", "bash", "zsh" },
        },

        gopls = {
          settings = {
            hoverKind = "NoDocumentation",
            deepCompletion = true,
            fuzzyMatching = true,
            completeUnimported = true,
            usePlaceholders = true,
          },
        },

        --[[
      sumneko_lua = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            completion = {
              keywordSnippet = "Disable",
            },
            diagnostics = {
              enable = true,
              globals = require("core.utils.lsp").lua_globals,
            },
            workspace = {
              library = {
                fn.expand "$VIMRUNTIME/lua",
                fn.expand "$VIMRUNTIME/lua/vim",
                unpack(api.list_runtime_paths()),
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
        on_new_config = function(config, _)
          config.settings.Lua.workspace.library = api.get_runtime_file("", true)
        end,
      },
      ]]

        sumneko_lua = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              diagnosticls = { globals = require("core.utils.lsp").lua_globals },
              format = { enable = false },
              hint = { enable = true },
              telemetry = { enable = false },
              workspace = { checkThirdParty = false },
            },
          },
        },
      }

      require("mason-lspconfig").setup_handlers {
        function(name)
          local config = server_configs[name] or {}
          if capabilities then
            config.capabilities = capabilities
          end
          config.on_attach = require("core.utils.lsp").on_attach
          lsp[name].setup(config)
        end,
      }
    end,
  },

  ts_rainbow = {
    setup = function()
      local api = require("core.utils").api
      api.create_autocmd("ColorScheme", {
        group = api.create_augroup("ts_rainbow-colors", {}),
        pattern = "nord",
        callback = function()
          local palette = require "core.utils.palette" "nord"
          api.set_hl(0, "rainbowcol1", { fg = palette.red })
          api.set_hl(0, "rainbowcol2", { fg = palette.orange })
          api.set_hl(0, "rainbowcol3", { fg = palette.magenta })
          api.set_hl(0, "rainbowcol4", { fg = palette.yellow })
          api.set_hl(0, "rainbowcol5", { fg = palette.green })
          api.set_hl(0, "rainbowcol6", { fg = palette.blue })
          api.set_hl(0, "rainbowcol7", { fg = palette.bright_cyan })
        end,
      })
    end,
  },

  treesitter = function()
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
      -- TODO: disable because too slow in C
      --[[
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = 'grr',
            },
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = 'gnd',
              list_definition = 'gnD',
              list_definition_toc = 'gO',
              goto_next_usage = '<A-*>',
              goto_previous_usage = '<A-#>',
            },
          },
        },
        ]]
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["ae"] = "@block.outer",
            ["ie"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["is"] = "@statement.inner",
            ["as"] = "@statement.outer",
            ["ad"] = "@comment.outer",
            ["id"] = "@comment.inner",
            ["am"] = "@call.outer",
            ["im"] = "@call.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        lsp_interop = {
          enable = true,
          peek_definition_code = {
            ["<Leader>Df"] = "@function.outer",
            ["<Leader>DF"] = "@class.outer",
          },
        },
      },
      rainbow = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
    }
    vim.keymap.set("n", "<Space>h", "<Cmd>TSHighlightCapturesUnderCursor<CR>")

    require("modules.start.config.lualine").is_ts_available = true
  end,

  null_ls = {
    config = function()
      local nls = require "null-ls"
      local helpers = require "null-ls.helpers"
      local command_resolver = require "null-ls.helpers.command_resolver"
      --local log = require "null-ls.logger"
      local utils = require "null-ls.utils"

      local function is_for_node(to_use)
        return function()
          local has_file = utils.make_conditional_utils().root_has_file {
            ".eslintrc",
            ".eslintrc.json",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yaml",
            ".prettierrc.yml",
          }
          return to_use and has_file or not has_file
        end
      end

      local cwd_for_eslint = helpers.cache.by_bufnr(function(params)
        return utils.root_pattern(
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.json"
        )(params.bufname)
      end)

      -- Search git root first instead of the parent dir of the file
      local function find_on_gitdir_at_first()
        local candidate = utils.path.join(utils.get_root(), "node_modules", ".bin")
        return utils.is_executable(candidate) and function()
          return candidate
        end or command_resolver.from_node_modules()
      end

      nls.setup {
        --debug = true,
        diagnostics_format = "[null-ls] #{m}",
        sources = {
          nls.builtins.code_actions.gitsigns,
          nls.builtins.code_actions.shellcheck,
          nls.builtins.diagnostics.fish,
          nls.builtins.diagnostics.mypy,
          nls.builtins.diagnostics.rubocop,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.trail_space,
          nls.builtins.diagnostics.vint,
          --nls.builtins.diagnostics.yamllint,
          nls.builtins.formatting.black,
          nls.builtins.formatting.fish_indent,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.gofumpt,
          nls.builtins.formatting.goimports,
          nls.builtins.formatting.golines,
          nls.builtins.formatting.rubocop,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.yamlfmt,
          nls.builtins.formatting.textlint,
          nls.builtins.hover.dictionary,

          nls.builtins.diagnostics.luacheck.with {
            extra_args = {
              "--globals",
              unpack(require("core.utils.lsp").lua_globals),
            },
          },

          nls.builtins.diagnostics.eslint.with {
            runtime_condition = is_for_node(true),
            cwd = cwd_for_eslint,
            dynamic_command = find_on_gitdir_at_first,
          },

          nls.builtins.formatting.eslint.with {
            runtime_condition = is_for_node(true),
            cwd = cwd_for_eslint,
            dynamic_command = find_on_gitdir_at_first,
          },

          nls.builtins.formatting.deno_fmt.with {
            runtime_condition = function(params)
              local clients = vim.lsp.get_active_clients { bufnr = params.bufnr }
              local denols = vim.tbl_filter(function(c)
                return c.config.name == "denols" or c.config.name == "sumneko_lua"
              end, clients)
              return #denols > 0 and true or false
            end,
          },

          nls.builtins.formatting.shfmt.with { extra_args = { "-i", "2", "-sr" } },

          nls.builtins.diagnostics.textlint.with { filetypes = { "markdown" } },

          --[[
          helpers.make_builtin {
            name = "perlcritic",
            meta = {
              url = "https://example.com",
              description = "TODO",
            },
            method = methods.internal.DIAGNOSTICS,
            filetypes = { "perl" },
            generator_opts = {
              command = "perlcritic",
              to_stdin = true,
              args = { "--severity", "1", "--verbose", "%s:%l:%c:%m (%P)\n" },
              format = "raw",
              check_exit_code = function(code)
                return code >= 1
              end,
              on_output = function(params, done)
                local output = params.output
                if not output then
                  return done()
                end

                local from_severity_numbers = { ["5"] = "w", ["4"] = "i", ["3"] = "n", ["2"] = "n", ["1"] = "n" }
                local lines = vim.tbl_map(function(line)
                  return line:gsub("Perl::Critic::Policy::", "", 1):gsub("^%d", function(severity_number)
                    return from_severity_numbers[severity_number]
                  end, 1)
                end, utils.split_at_newline(params.bufnr, output))

                local diagnostics = {}
                local qflist = vim.fn.getqflist { efm = "%t:%l:%c:%m", lines = lines }
                local severities = { w = 2, i = 3, n = 4 }

                for _, item in pairs(qflist.items) do
                  -- TODO: use perlnavigator instead
                  if item.valid == 1 and severities[item.type] > 3 then
                    local col = item.col > 0 and item.col - 1 or 0
                    table.insert(diagnostics, {
                      row = item.lnum,
                      col = col,
                      source = "perlcritic",
                      message = item.text,
                      severity = severities[item.type],
                    })
                  end
                end

                return done(diagnostics)
              end,
            },
            factory = helpers.generator_factory,
          },
          ]]

          -- TODO: use perlnavigator instead
          --[[
          helpers.make_builtin {
            name = "efm-perl",
            meta = { url = "https://example.com", description = "TODO" },
            method = methods.internal.DIAGNOSTICS,
            filetypes = { "perl" },
            generator_opts = {
              command = "efm-perl",
              args = { "-f", "$FILENAME" },
              to_stdin = true,
              format = "raw",
              on_output = helpers.diagnostics.from_errorformat("%l:%m", "efm-perl"),
            },
            factory = helpers.generator_factory,
          },
          ]]
        },

        --on_attach = on_attach,
        on_attach = require("core.utils.lsp").on_attach,
      }
    end,

    run = function()
      local fn, uv = require("core.utils").globals()
      local dir = fn.stdpath "cache" .. "/lspconfig"
      do
        local stat = uv.fs_stat(dir)
        if not stat then
          assert(uv.fs_mkdir(dir, 448))
        end
      end
      local file = dir .. "/updated"
      local last_updated = 0
      do
        local fd = uv.fs_open(file, "r", 438)
        if fd then
          local stat = uv.fs_fstat(fd)
          local data = uv.fs_read(fd, stat.size, 0)
          uv.fs_close(fd)
          last_updated = tonumber(data) or 0
        end
      end
      local now = os.time()
      if now - last_updated > 24 * 3600 * 7 then
        local ok = pcall(require("core.utils.lsp").update_tools)
        if ok then
          local fd = uv.fs_open(file, "w", 438)
          if fd then
            uv.fs_write(fd, now, -1)
            uv.fs_close(fd)
          else
            error("cannot open the file to write: " .. file)
          end
        end
      end
    end,
  },

  mason_tool_installer = function()
    local api = require("core.utils").api

    vim.notify "loading mason-tool-installer"
    local Interval = require "core.utils.interval"
    local itvl = Interval.new("mason_tool_installer", 24 * 7 * 3600)
    local is_over = itvl:is_over()

    if is_over then
      api.create_autocmd("User", {
        pattern = "MasonToolsUpdateCompleted",
        once = true,
        callback = function()
          local Job = require "plenary.job"
          local mason_registry = require "mason-registry"
          local textlint_path = mason_registry.get_package("textlint"):get_install_path()

          Job:new({
            command = "npm",
            args = { "i", "textlint-rule-preset-ja-spacing" },
            cwd = textlint_path,
            on_start = function()
              vim.notify "installing additional components"
            end,
            on_exit = function(self, code, _)
              if code == 0 then
                vim.notify "finished to update Mason tools"
              else
                local err = table.concat(self:stderr_result(), "\n")
                vim.notify(("failed to update Mason tools: code=%d\n%s"):format(code, err))
              end
            end,
          }):start()
        end,
      })

      vim.notify("Tools are old. Updating�c�c", vim.log.levels.WARN)
    end

    local mason_tool_installer = require "mason-tool-installer"
    mason_tool_installer.setup {
      auto_update = is_over,
      ensure_installed = {
        "ansible-language-server",
        "awk-language-server",
        "bash-language-server",
        "clangd",
        "cmake-language-server",
        "css-lsp",
        "deno",
        "dockerfile-language-server",
        "dot-language-server",
        "eslint-lsp",
        "gofumpt",
        "goimports",
        "golangci-lint-langserver",
        "golines",
        "gopls",
        "intelephense",
        "jq",
        "json-lsp",
        "jsonnet-language-server",
        "lua-language-server",
        "luacheck",
        "marksman",
        "perlnavigator",
        "prettierd",
        "pyright",
        "shellcheck",
        "shfmt",
        "solargraph",
        "stylua",
        "terraform-ls",
        "textlint",
        "typescript-language-server",
        "vim-language-server",
        "vint",
        "vue-language-server",
        "yaml-language-server",
      },
    }
    mason_tool_installer.check_install()

    if is_over then
      itvl:update()
    end
  end,

  treehopper = {
    setup = function()
      local keymap = vim.keymap
      keymap.set("o", [['t]], [[:<C-u>lua require'tsht'.nodes()<CR>]], { remap = true })
      keymap.set("x", [['t]], [[:lua require'tsht'.nodes()<CR>]])
    end,
  },
}
