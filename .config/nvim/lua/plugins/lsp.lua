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
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                suggestion = { enabled = false },
                panel = { enabled = false }
            })
        end
    },
    {
        'zbirenbaum/copilot-cmp.lua',
        dependencies = { 'zbirenbaum/copilot.lua' },
        config = function()
            require('copilot_cmp').setup()
        end
    },
    -- TODO: Fix Navic
    -- {
    --     "SmiteshP/nvim-navic",
    --     dependencies = {
    --         'neovim/nvim-lspconfig'
    --     },
    --     config = function()
    --         local navic = require('navic')
    --         local navic = require("nvim-navic")
    --
    --
    --     end
    -- },
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
            'zbirenbaum/copilot.lua',
            'zbirenbaum/copilot-cmp.lua',
            'onsails/lspkind.nvim'
        },
        config = function()
            local lsp_zero = require('lsp-zero')

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

                lsp_zero.buffer_autoformat()
            end)

            lsp_zero.set_sign_icons({
                error = '',
                warn = '',
                hint = '󰌵',
                info = '󰙎'
            })

            -- to learn how to use mason.nvim with lsp-zero
            -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'tsserver', 'eslint' },
                handlers = {
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
                },
            })

            local lspkind = require('lspkind')

            lspkind.init({
                symbol_map = {
                    Copilot = ''
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
                    { name = "buffer" }

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
