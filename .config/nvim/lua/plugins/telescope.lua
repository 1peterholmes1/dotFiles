return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            local actions = require('telescope.actions')
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
            vim.keymap.set('n', 'gr', builtin.lsp_references, {})
            vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
            vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
            vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, {})
        end
    },
}
