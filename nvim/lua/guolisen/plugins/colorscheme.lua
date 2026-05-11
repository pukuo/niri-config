-- NOTE: catppuccin 
require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    custom_highlights = function(colors)
        return {
            ColorColumn = { bg = "#1C1C21" },

            -- Pmenu styling (similar to your rose-pine)
            Pmenu = { bg = colors.transparent_background, fg = colors.text },
            PmenuSel = { bg = colors.surface2, fg = "NONE" },
            PmenuSbar = { bg = colors.surface0 },
            PmenuThumb = { bg = colors.overlay2 },

            -- For fully transparent
            -- Normal = { bg = "none" },
            NormalFloat = { bg = "none" },
        }
    end,
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = { errors = { "italic" }, hints = { "italic" } },
        },
        lsp_trouble = true,
        lsp_saga = true,
        cmp = true,
        telescope = true,
        which_key = true,
        gitsigns = true,
        markdown = true,
        mini = true,
        dap = true,
        dap_ui = true,
        -- terminal = false,
    },
})
