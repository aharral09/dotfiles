require("obsidian").setup({
    workspaces = {
        {
            name = "notes",
            path = "~/notes",
        }
    },
    ui = {
        bulet = {
            right_pad = 1
        },
    },
    daily_notes = {
        folder = "daily",
        default_tags = { "daily-notes" },
    },
    note_id_func = function(title)
    return title
    end,
})
