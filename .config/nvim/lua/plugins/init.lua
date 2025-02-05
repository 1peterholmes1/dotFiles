return {
    -- { "rose-pine/neovim",                 name = "rose-pine" },
    {
        -- Automatically change color theme based on system
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
        -- Catppuccin theme
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup({ transparent_background = true })
            vim.cmd.colorscheme('catppuccin')
        end
    },
    {
        -- Automatically close open parentheses and brackets
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        -- Icons for filetypes
        'nvim-tree/nvim-web-devicons'
    },
    {
        -- Shows lsp status updates in bottom right
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
        -- Adds the ability to view undo history
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end,
        event = "BufEnter"
    }
}
