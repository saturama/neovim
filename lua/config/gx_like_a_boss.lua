-- www.youtube.com
-- https://google.com
-- obsidian://open?vault=obsidian&file=_home

local method = "xdg-open"

local function normalize_url(target)
    if target:match("^www%.") then
        return "https://" .. target
    elseif target:match("^https?://") or
        target:match("^ftp://") or
        target:match("^file://") or
        target:match("^mailto:") or
        target:match("^[a-z]+://") then
        return target
    end
    return nil
end

vim.keymap.set({ "n" }, "gx", function()
    local target = vim.fn.expand('<cfile>')
    local url = normalize_url(target)
    if url then
        vim.fn.jobstart({ method, url }, {
            detach = true,
            on_exit = function(_, exit_code)
                if exit_code ~= 0 then
                    vim.notify("Failed to open: " .. url, vim.log.levels.ERROR)
                end
            end
        })
    else
        vim.notify("Not a URL: " .. target, vim.log.levels.INFO)
    end
end)
