return {
    {
        -- Displays a dashboard on startup
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    header = {
                        [[                                                                       ]],
                        [[                                                                     ]],
                        [[       ████ ██████           █████      ██                     ]],
                        [[      ███████████             █████                             ]],
                        [[      █████████ ███████████████████ ███   ███████████   ]],
                        [[     █████████  ███    █████████████ █████ ██████████████   ]],
                        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                        [[                                                                       ]],
                    },
                    project = { enable = false },
                    mru = { cwd_only = true },
                    shortcut = {
                        { desc = 'Search Files ', group = 'Label', action = 'Telescope find_files', key = 'f' },
                        { desc = 'Search All Files ', group = 'Label', action = function()
                            local builtin = require('telescope.builtin')
                            builtin.find_files { hidden = true, no_ignore = true }
                        end
                        , key = 'F' },
                        { desc = 'Find Word ',    group = 'Label', action = 'Telescope live_grep',  key = 'w' },
                        { desc = 'Find Word Everywhere ', group = 'Label', action = function()
                            local builtin = require('telescope.builtin')
                            builtin.live_grep {
                                additional_args = function(args)
                                    return vim.list_extend(args,
                                        { "--hidden", "--no-ignore" })
                                end
                            }
                        end, key = 'W' },
                        { desc = 'Toggle Tree ', group = 'Label', action = 'Neotree toggle', key = 'e' },
                        { desc = 'Quit ',        group = 'Label', action = 'q',              key = 'q' },
                    },
                    footer = {}
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
}
