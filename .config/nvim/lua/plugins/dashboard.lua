return {
    {
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
                        { desc = 'Find Files ',  group = 'Label', action = 'Telescope find_files', key = 'f' },
                        { desc = 'Toggle Tree ', group = 'Label', action = 'Neotree toggle',       key = 'e' },
                        { desc = 'Quit ',        group = 'Label', action = 'q',                    key = 'q' },
                        { desc = 'Find Word ',   group = 'Label', action = 'Telescope live_grep',  key = 'w' },
                    },
                    footer = {}
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
}
