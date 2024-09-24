vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ":w<CR>", {})
vim.cmd("set clipboard+=unnamedplus")

local function on_attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

--local lspClient = vim.lsp.start_client {
--name = "mapperlsp",
--cmd = { "/home/rapha/mapperlsp/main" },
--on_attach = on_attach
--}

--if not lspClient then
--vim.notify "putt"
--return
--end

--vim.api.nvim_create_autocmd("FileType", {
--pattern = "json",
--callback = function()
--vim.lsp.buf_attach_client(0, lspClient)
--end
--})
