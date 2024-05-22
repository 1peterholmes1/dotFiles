return {
    -- { "rose-pine/neovim",                 name = "rose-pine" },
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
