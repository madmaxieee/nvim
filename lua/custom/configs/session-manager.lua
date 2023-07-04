local config = require "session_manager.config"

require("session_manager").setup {
  autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
}

local augroup = vim.api.nvim_create_augroup("session_manager", { clear = true })

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "SessionLoadPost",
  group = augroup,
  callback = function()
    require("nvim-tree.api").tree.toggle(false, true)
  end,
})

-- vim.api.nvim_create_autocmd({ "VimLeave" }, {
--   group = augroup,
--   callback = function()
--     if vim.bo.filetype ~= "git" and not vim.bo.filetype ~= "gitcommit" and not vim.bo.filetype ~= "gitrebase" then
--       local tree_is_visible = require("nvim-tree.api").tree.is_visible()
--       require("session_manager").autosave_session()
--       if tree_is_visible then
--         require("nvim-tree.api").tree.toggle(false, true)
--       end
--     end
--   end,
-- })
