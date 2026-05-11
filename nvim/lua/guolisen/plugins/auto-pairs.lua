local autopairs = require("nvim-autopairs")

-- setup autopairs
autopairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})
