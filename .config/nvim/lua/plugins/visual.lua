return {
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                filetypes = {
                    css = { css = true },
                    html = { css = true },
                    vue = { css = true, tailwind = true },
                    svelte = { css = true, tailwind = true },
                    javascript = { css = true, tailwind = true },
                    typescript = { css = true, tailwind = true },
                }
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
    }
}
