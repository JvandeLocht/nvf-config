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

-- Autoreload of File, if changed on disk. Sending notification if it got changed.
VIM.o.autoread = true
VIM.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
        callback = function()
                if VIM.fn.mode() ~= "c" then
                        VIM.cmd("checktime")
                end
        end,
        pattern = { "*" },
})
VIM.api.nvim_create_autocmd("FileChangedShellPost", {
        callback = function()
                VIM.notify("File changed on disk. Buffer reloaded.", VIM.log.levels.WARN)
        end,
})
