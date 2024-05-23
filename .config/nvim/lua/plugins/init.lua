return {
    -- { "rose-pine/neovim",                 name = "rose-pine" },
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            update_interval = 3000,
            set_dark_mode = function()
                vim.api.nvim_set_option("background", "dark")
                vim.cmd.colorscheme('catppuccin')
            end,
            set_light_mode = function()
                vim.api.nvim_set_option("background", "light")
                vim.cmd.colorscheme('catppuccin')
            end
        }
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({ transparent_background = true })
            vim.cmd.colorscheme('catppuccin')
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
            notification = {
                window = {
                    winblend = 0,
                },
            },
        },
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end,
        event = "BufEnter"
    }
}
