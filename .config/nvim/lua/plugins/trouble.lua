return {
    {
        -- Highlights TODO, FIXME, etc. comments
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim", 'folke/trouble.nvim' },
        opts = {
            vim.keymap.set('n', '<leader>td', '<Cmd>TodoTrouble toggle<CR>', {}),
            vim.keymap.set('n', '<leader>ftd', '<Cmd>TodoTelescope<CR>', {})
        }
    },
    {
        -- Displays diagnostics
        "folke/trouble.nvim",

        opts = {
            modes = {
                diagnostics = {
                    mode = "diagnostics",
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.3
                    }
                },
                todo = {
                    mode = "todo",
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.3
                    }
                }
            }
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Trouble",
        keys = {
            {
                "<leader>tt",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)"
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
        }
    }
}
