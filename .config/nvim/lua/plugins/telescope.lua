return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fF', function()
                builtin.find_files { hidden = true, no_ignore = true }
            end)
            vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fW', function()
                builtin.live_grep {
                    additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
                }
            end)
            vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
        end
    },
}
