return {
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                -- filetypes = {
                --     css = { css = true },
                --     html = { css = true },
                --     vue = { names = false, tailwind = true },
                --     svelte = { css = true, tailwind = true },
                --     javascript = { css = true, tailwind = true },
                --     typescript = { css = true, tailwind = true },
                -- }
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    RRGGBBAA = true,
                    names = false,
                    css_fn = true,
                    tailwind = true
                },
                filetypes = { '*' }
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require('ibl').setup({
                scope = {
                    show_start = false,
                },
                exclude = {
                    filetypes = { "dashboard" }
                }
            })
        end
    },
    {
        "nmac427/guess-indent.nvim",
        config = function()
            require('guess-indent').setup {}
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure({
                filetypes_denylist = {
                    "dashboard"
                }
            })
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {

        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        config = function()
            require('noice').setup({
                presets = {
                    command_palette = true
                }
            })
            require('notify').setup({
                background_colour = '#000000',
            })
        end
    }
}
