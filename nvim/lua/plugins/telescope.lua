return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>p', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    
    end
    
}