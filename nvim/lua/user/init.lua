--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local utils = require "astronvim.utils"

local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin",     -- remote to use
                channel = "stable",    -- "stable" or "nightly"
                version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main",       -- branch name (NIGHTLY ONLY)
                commit = nil,          -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false,  -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false,   -- automatically reload and sync packer after a successful update
                auto_quit = false,     -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- -- Set colorscheme to use
        -- colorscheme = "default_theme",

        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = function(local_vim)
                -- set to true or false etc.
                local_vim.opt.relativenumber = true           -- sets vim.opt.relativenumber
                local_vim.opt.number = true                   -- sets vim.opt.number
                local_vim.opt.spell = false                   -- sets vim.opt.spell
                local_vim.opt.signcolumn = "auto"             -- sets vim.opt.signcolumn to auto
                local_vim.opt.wrap = false                    -- sets vim.opt.wrap
                local_vim.g.mapleader = " "                   -- sets vim.g.mapleader
                local_vim.g.autoformat_enabled = true         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                local_vim.g.cmp_enabled = true                -- enable completion at start
                local_vim.g.autopairs_enabled = true          -- enable autopairs at start
                local_vim.g.diagnostics_enabled = true        -- enable diagnostics at start
                local_vim.g.status_diagnostics_enabled = true -- enable diagnostics in statusline
                local_vim.g.icons_enabled = true              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                local_vim.g.ui_notifications_enabled = true   -- disable notifications when toggling UI elements
                local_vim.g.heirline_bufferline = false       -- enable new heirline based bufferline (requires :PackerSync after changing)
                local_vim.g.vimtex_view_method = 'skim'
                local_vim.g.tabstop = 4
                local_vim.g.shiftwidth = 4
                local_vim.g.noexpandtab = true
                local_vim.g.offset_encoding = "utf-16"
                local_vim.g.sftp_sync_servers = {
                        cs350 = {
                                local_path = '/Users/peter/CS350',
                                remote_path = '/home/student-csci350',
                                host = 'localhost',
                                port = 1212,
                                username = 'student-csci350',
                                password = 'student350',
                        },
                }
                local_vim.g.loaded_remote_plugins = nil
                return local_vim
        end,
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                "                                                                       ",
                "                                                                     ",
                "       ████ ██████           █████      ██                     ",
                "      ███████████             █████                             ",
                "      █████████ ███████████████████ ███   ███████████   ",
                "     █████████  ███    █████████████ █████ ██████████████   ",
                "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                "                                                                       "
        },


        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true,     -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                        clangd = {
                                capabilities = {
                                        offsetEncoding = "utf-16"
                                }
                        }
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        ["<leader>tt"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble pane" },
                        ["<leader>td"] = { "<cmd>TodoLocList<cr>", desc = "Toggle TODO Location pane" },
                        ["<leader>tl"] = { function() utils.toggle_term_cmd({ cmd = 'lazygit', direction = 'float' }) end, desc =
                        "ToggleTerm lazygit" },
                        -- quick save
                        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                        ["<Tab>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer"},
                        ["<S-Tab>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer"},
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },

        -- Configure plugins
        plugins = {
                {
                        "pocco81/auto-save.nvim",
                        config = function()
                                require('auto-save').setup {
                                        trigger_events = { "InsertLeave" }
                                }
                        end,
                        lazy = false
                },
                "lervag/vimtex",
                {
                        "folke/todo-comments.nvim",
                        dependencies = "nvim-lua/plenary.nvim",
                        lazy = false,
                        config = function()
                                require("todo-comments").setup {}
                        end,
                },
                {
                        "folke/trouble.nvim",
                        dependencies = "nvim-web-devicons",
                        config = function()
                                require("trouble").setup {
                                        position = "right",
                                        width = 50,
                                }
                        end
                },
                {
                        "ray-x/lsp_signature.nvim",
                        config = function()
                                require("lsp_signature").setup()
                        end
                },
                "nvim-emmet/nvim-emmet",
                "kdheepak/lazygit.nvim",
                {
                        "zbirenbaum/copilot.lua",
                        cmd = "Copilot",
                        event = "InsertEnter",
                        config = function()
                                require("copilot").setup({
                                        suggestion = { enabled = false },
                                        panel = { enabled = false }
                                })
                        end
                },
                {
                        "zbirenbaum/copilot-cmp",
                        after = { "copilot.lua", "nvim-cmp" },
                        config = function()
                                require("copilot_cmp").setup()
                                -- astronvim.add_cmp_source({ name = "copilot", priority = 700 })
                        end
                },
                {
                        "akinsho/toggleterm.nvim",
                        config = function()
                                require('toggleterm').setup {
                                        direction = 'horizontal'
                                }
                        end
                },
                {
                        "AstroNvim/astrotheme",
                },
                {
                        "goolord/alpha-nvim",
                        opts = function(_, opts)
                                opts.section.header.val = {
                                        "                                                                       ",
                                        "                                                                     ",
                                        "       ████ ██████           █████      ██                     ",
                                        "      ███████████             █████                             ",
                                        "      █████████ ███████████████████ ███   ███████████   ",
                                        "     █████████  ███    █████████████ █████ ██████████████   ",
                                        "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                                        "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                                        " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                                        "                                                                       "
                                }
                        end
                },
                {
                        "hrsh7th/nvim-cmp",
                        dependencies = {
                                "zbirenbaum/copilot-cmp"
                        },
                        opts = function(_, opts)
                                local cmp = require "cmp"
                                opts.sources = cmp.config.sources {
                                        { name = "nvim_lsp", priority = 1000 },
                                        { name = "luasnip",  priority = 750 },
                                        { name = "buffer",   priority = 250 },
                                        { name = "copilot",  priority = 700 }
                                }
                                return opts
                        end
                },
                {
                        "tpope/vim-fugitive",
                        lazy = false
                },
                {
                        "christoomey/vim-tmux-navigator",
                        lazy = false
                },
                -- {
                --         "jamestthompson3/nvim-remote-containers",
                --         lazy = false
                -- },
                {
                        "esensar/nvim-dev-container",
                        dependencies = {
                                "nvim-treesitter/nvim-treesitter"
                        },
                        lazy = false,
                        opts = function ()
                                require("devcontainer").setup{}
                        end
                },
                {
                        "termoshtt/toggl.nvim",
                        lazy = false
                },
                {
                        "anuvyklack/pretty-fold.nvim",
                        opts = function()
                                require('pretty-fold').setup()
                        end,
                        lazy = false,
                },

                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = {        -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                        autotag = {
                                enable = true,
                                filetypes = {
                                        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact',
                                        'svelte', 'vue', 'tsx',
                                        'jsx', 'rescript',
                                        'css', 'lua', 'xml', 'php', 'markdown'
                                }
                        }
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },
        }
}

return config
