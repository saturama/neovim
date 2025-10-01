-- https://github.com/adibhanna/minimal-vim/blob/main/lua/plugins/blink.lua
return {
  { "L3MON4D3/LuaSnip", keys = {} },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    config = function()
      require("blink.cmp").setup({
        -- отключаем rust-бэкенд, используем lua-версию fuzzy
        fuzzy = { implementation = "lua" },

        snippets = { preset = "luasnip" },
        signature = { enabled = false },

        appearance = {
          use_nvim_cmp_as_default = false,
          nerd_font_variant = "normal",
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        keymap = {
          ["<C-f>"] = {},
        },

        completion = {
          menu = {
            border = "rounded",
            scrolloff = 1,
            scrollbar = false,
            draw = {
              columns = {
                { "kind_icon" },
                { "label", "label_description", gap = 1 },
                { "kind" },
                { "source_name" },
              },
            },
          },
          documentation = {
            window = {
              border = "rounded",
              scrollbar = false,
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
            },
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
      })

      -- грузим готовые сниппеты
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
