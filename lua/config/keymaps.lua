-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
function GitCommit()
    -- Prompt user for commit message
    local commit_msg = vim.fn.input("Commit message: ")

    -- If the message is not empty, run the git command
    if commit_msg and commit_msg ~= "" then
        vim.cmd('!git add . && git commit -m "' .. commit_msg .. '" && git push')
    else
        print("Commit message cannot be empty")
    end
end
vim.keymap.set("n", "<leader>gg", GitCommit, { silent = true, desc = "Git commit" })
vim.keymap.set("n", "<leader>ga", function()
    vim.cmd("!git add .")
end, { silent = true, desc = "Git add all" })

vim.keymap.set("n", "<M-,>", "A,<CR>", { desc = ", NL" })
vim.keymap.set("n", "<M-;>", "A;<CR>", { desc = "; NL" })
vim.keymap.set("n", "<M-l>", "A<CR>", { desc = "NL" })

vim.keymap.set("i", "<M-,>", "<End>,<CR>", { desc = ", NL" })
vim.keymap.set("i", "<M-;>", "<End>;<CR>", { desc = "; NL" })
vim.keymap.set("i", "<M-l>", "<End><CR>", { desc = "NL" })
