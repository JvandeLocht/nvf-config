VIM = vim
VIM.opt.backup = false      -- Disable backup files
VIM.opt.writebackup = false -- Disable writing backup files


-- Create a group for the highlight autocommand (optional, but good practice)
local highlight_group = VIM.api.nvim_create_augroup("HighlightYank", { clear = true })

-- Highlight yanked text briefly using the IncSearch group
VIM.api.nvim_create_autocmd("TextYankPost", {
        group = highlight_group,
        pattern = "*",
        callback = function()
                VIM.highlight.on_yank({
                        higroup = "IncSearch",
                        timeout = 150,
                        on_visual = true, -- set to false to skip visual selections
                })
        end,
})
