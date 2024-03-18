return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim", 'folke/trouble.nvim' },
        opts = {
            vim.keymap.set('n', '<leader>td', '<Cmd>TodoTrouble<CR>', {})
        }
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local trouble = require("trouble")
            vim.keymap.set('n', '<leader>tt', function() trouble.toggle() end)
        end
    }
}
