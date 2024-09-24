return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "tsserver", "intelephense" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.somesass_ls.setup({
                capabilities = capabilities
            })
            lspconfig.css_variables.setup({
                capabilities = capabilities
            })
            lspconfig.efm.setup {
                cmd = { "efm-langserver", "-logfile", "/home/rapha/logfile.log", "-loglevel", "7" },
                init_options = { documentFormatting = true },
                settings = {
                    rootMarkers = {"composer.json"},
                    languages = {
                        twig = {
                            {
                                formatCommand = "twig-cs-fixer fix ${INPUT}",
                                formatStdin = true,
                            },
                        },
                    },
                },
                filetypes = { "twig" },
            }
            vim.keymap.set("n", "<leader>hd", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
