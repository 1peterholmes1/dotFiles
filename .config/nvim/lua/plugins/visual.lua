return {
    {
        -- Adds background color to hex codes and rgb values
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
        -- Adds columns to indicate indentation levels, highlights the indentation of current scope
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require('ibl').setup({
                scope = {
                    show_start = false,
                },
                exclude = {
                    filetypes = { "dashboard" }
                },
                whitespace = {
                    highlight = "SpecialKey",
                }
            })
        end
    },
    {
        -- Sets the indentation settings for the current buffer
        "nmac427/guess-indent.nvim",
        config = function()
            require('guess-indent').setup {}
        end
    },
    {
        -- Highlights occurences of the word/symbol under the cursor
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
        -- Replaces the UI of the messages and command lines
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
    },
    {
        -- Renders whitespace when in visual mode
        'mcauley-penney/visual-whitespace.nvim',
        config = true
    }
}
