return {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'onsails/lspkind.nvim' },
    {
        'supermaven-inc/supermaven-nvim',
        config = function()
            require('supermaven-nvim').setup({
                disable_keymaps = true,
                disable_inline_completion = true,
                log_level = 'off',
            })
        end,
    },
    -- {
    --     'zbirenbaum/copilot.lua',
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require('copilot').setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false }
    --         })
    --     end
    -- },
    -- {
    --     'zbirenbaum/copilot-cmp',
    --     dependencies = { 'zbirenbaum/copilot.lua' },
    --     config = function()
    --         require('copilot_cmp').setup()
    --     end
    -- },
    {
        -- Show scopes at the top of the screen
        "SmiteshP/nvim-navic",
        config = function()
            require('nvim-navic').setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            -- 'zbirenbaum/copilot.lua',
            -- 'zbirenbaum/copilot-cmp',
            'onsails/lspkind.nvim',
            "SmiteshP/nvim-navic",
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            local navic = require('nvim-navic')

            local function allow_format(servers)
                return function(client) return vim.tbl_contains(servers, client.name) end
            end

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr }

                vim.keymap.set({ 'n', 'x' }, '<leader>lf', function()
                    vim.lsp.buf.format({
                        async = false,
                        timeout_ms = 10000,
                        filter = allow_format({ 'lua_ls', 'rust_analyzer', 'prettier' })
                    })
                end, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>la', function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set('n', '<leader>ld', function()
                    vim.diagnostic.open_float()
                end, opts)

                vim.keymap.set('n', '<leader>lh', function()
                    vim.lsp.buf.signature_help()
                end, opts)

                vim.keymap.set('n', '<leader>lr', function()
                    vim.lsp.buf.rename()
                end, opts)

                local non_navic_clients = { copilot = true, tailwindcss = true, emmet_ls = true, eslint = true }
                if not non_navic_clients[client.name] then
                    navic.attach(client, bufnr)
                end

                if vim.bo.filetype ~= 'javascript' then
                    lsp_zero.buffer_autoformat()
                end
            end)

            lsp_zero.set_sign_icons({
                error = '',
                warn = '',
                hint = '󰌵',
                info = '󰙎'
            })
            -- local util = require 'lspconfig.util'
            -- local function get_typescript_server_path(root_dir)
            --     local global_ts = '/Users/peter/.volta/tools/shared/typescript/lib'
            --     -- Alternative location if installed as root:
            --     -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
            --     local found_ts = ''
            --     local function check_dir(path)
            --         found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
            --         if util.path.exists(found_ts) then
            --             return path
            --         end
            --     end
            --     if util.search_ancestors(root_dir, check_dir) then
            --         return found_ts
            --     else
            --         return global_ts
            --     end
            -- end

            -- require 'lspconfig'.volar.setup {
            --     on_new_config = function(new_config, new_root_dir)
            --         new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
            --     end,
            -- }
            -- to learn how to use mason.nvim with lsp-zero
            -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    -- 'tsserver',
                    'eslint', 'volar' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    volar = function()
                        -- TODO: Fix this to use the correct tsdk - also make sure tsserver doesn't run when volar is running https://github.com/williamboman/mason-lspconfig.nvim/issues/371
                        local tsServerPath = require('mason-registry')
                            .get_package('typescript-language-server')
                            :get_install_path()

                        require('lspconfig').volar.setup({
                            filetypes = { 'vue' },
                            init_options = {
                                vue = {
                                    hybridMode = false
                                },
                                typescript = {
                                    tsdk = tsServerPath
                                }
                            }
                        })
                    end,
                    -- tsserver = function()
                    --     local vue_typescript_plugin = require('mason-registry')
                    --         .get_package('vue-language-server')
                    --         :get_install_path()
                    --         .. '/node_modules/@vue/language-server'
                    --         .. '/node_modules/@vue/typescript-plugin'
                    --
                    --     require('lspconfig').tsserver.setup({
                    --         init_options = {
                    --             plugins = {
                    --                 {
                    --                     name = '@vue/typescript-plugin',
                    --                     location = vue_typescript_plugin,
                    --                     languages = { 'javascript', 'typescript', 'vue' }
                    --                 }
                    --             }
                    --         },
                    --         filetypes = {
                    --             'javascript',
                    --             'javascriptreact',
                    --             'javascript.jsx',
                    --             'typescript',
                    --             'typescriptreact',
                    --             'typescript.tsx',
                    --             'vue'
                    --         }
                    --     })
                    -- end,
                    lsp_zero.default_setup,
                    lua_ls = function()
                        require('lspconfig').lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { 'vim' }
                                    }
                                }
                            }
                        })
                    end,
                    -- tsserver = function()
                    --     require('lspconfig').tsserver.setup {
                    --         init_options = {
                    --             plugins = {
                    --                 {
                    --                     name = "@vue/typescript-plugin",
                    --                     languages = { 'javascript', 'typescript', 'vue' },
                    --                     location = '/Users/peter/.volta/tools/shared/@vue/typescript-plugin',
                    --                 }
                    --             }
                    --         },
                    --         filetypes = {
                    --             'javascript',
                    --             'typescript',
                    --             'vue'
                    --         }
                    --     }
                    -- end,
                    -- volar = function()
                    --     require('lspconfig').volar.setup {
                    --         on_new_config = function(new_config, new_root_dir)
                    --             new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
                    --         end
                    --     }
                    -- end,
                },
            })

            local lspkind = require('lspkind')

            lspkind.init({
                symbol_map = {
                    Copilot = '',
                    Supermaven = '󰫺'
                }
            })

            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "copilot" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "supermaven" }

                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                    })
                }
            })
        end
    },
}
