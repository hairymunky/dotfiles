-- catppuccin

return {
    "catppuccin/nvim", name="catppuccin", priority = 1000,
    
    config = function()
        require("catppuccin").setup({
            flavour = "latte" -- latte, frappe, macchiato, mocha, auto
        })

        vim.cmd.colorscheme "catppuccin"
    end,
}
