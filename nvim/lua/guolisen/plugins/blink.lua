require("blink.cmp").setup({
    fuzzy = {
        implementation = "lua",
    },
    -- keymaps 
    keymap = {
        preset = "none",
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    -- editor insert mode completions
    completion = {
        menu = {
            auto_show = true, -- show on type
        },
        documentation = {
            auto_show = true, -- show function signature/docs 
        },
        ghost_text = {
            enabled = false,
            show_with_menu = false,
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
    },

    -- cmdline completions
    cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
        completion = {
            menu = { auto_show = true },
        },
    },

    sources = {
        default = { "lsp", "path", "buffer", "snippets" },
        providers = {
            lsp = {
                opts = {
                    tailwind_color_icon = "󱓻"
                }
            }
        }
    },

    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },

    snippets = {
        preset = "luasnip"
    },
})

