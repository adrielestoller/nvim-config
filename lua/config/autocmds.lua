vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 3000,
        })
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            border = "rounded",
            scope = "cursor",
        })
    end,
})

