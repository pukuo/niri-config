-- early pack hooks
--require("guolisen.plugins.pack-hooks")

-- plugins
vim.pack.add({
    -- Core
    { src = "https://github.com/nvim-lualine/lualine.nvim" }, --enabled
    { src = "https://github.com/windwp/nvim-autopairs" }, --enabled

    -- blink
    { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.1" },

    -- LSP stack
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },

    -- icons
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }, --enabled

    -- colorschemes
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin-nvim" },
})

-- Custom packer commands
-- NOTE: pack add
vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (PackAdd user/repo)", })

-- NOTE: pack update
vim.api.nvim_create_user_command("PackUpdate", function(opts)
    if opts.args ~= "" then
        -- update specific plugins
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
        vim.pack.update(plugins)
    else
        -- update all
        vim.pack.update()
    end
end, { desc = "Update all plugins or specific ones", nargs = "*", }
)

-- NOTE: pack del
vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (space separated)" })

-- NOTE: pack nonactive - show all non active plugins on disk but removed from pack.lua
vim.api.nvim_create_user_command("PackCheck", function()
    local non_active = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    if #non_active == 0 then
        vim.notify("🆗 No non-active plugins found!", vim.log.levels.INFO)
        return
    end

    vim.print("😴 Non-active plugins :")
    print(" ")
    -- vim.print(non_active)
    for _, name in ipairs(non_active) do
        print(name)
    end

    print(" ")

    local choice = vim.fn.confirm(
        "Delete ALL non-active plugins from disk?",
        "&Yes\n&No",
        2  -- default = No
    )

    if choice == 1 then
        vim.pack.del(non_active)
        vim.notify("🗑️  Deleted " .. #non_active .. " non-active plugin(s)", vim.log.levels.INFO)
        print("Non-active plugins deleted!")
        vim.api.nvim_exec_autocmds("User", { pattern = "PackChanged" })
    else
        vim.notify("Cancelled. No plugins were deleted!", vim.log.levels.INFO)
    end
end, { desc = "List non active plugins and select to delete"})


-- NOTE: Call plugins
-- This can be moved to init.lua @ guolisen/plugins/

-- Themes
require("guolisen.plugins.colorscheme")

-- UI & Others
require("guolisen.plugins.lualine")
require("guolisen.plugins.auto-pairs")

-- Completion
-- require("guolisen.plugins.nvim-cmp")
require("guolisen.plugins.blink")

-- LSP 
require("guolisen.plugins.lsp.mason") -- mason has to load before lspconfig
require("guolisen.plugins.lsp.lspconfig")

