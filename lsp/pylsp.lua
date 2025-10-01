return {
    cmd = { "pylsp" },
    filetypes = {
        "python",
    },

    -- Можно задать настройки самого pylsp
    settings = {
        pylsp = {
            plugins = {
                pyflakes = { enabled = true },
                pycodestyle = { enabled = true },
                mccabe = { enabled = true },
                yapf = { enabled = false }, -- форматтер по вкусу
            },
        },
    },
}
