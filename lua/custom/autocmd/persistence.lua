local persistence_group = vim.api.nvim_create_augroup("Persistence", { clear = true })
local home = vim.fn.expand "~"
local disabled_dirs = {
  [home] = true,
  [home .. "/Downloads"] = true,
  ["/private/tmp"] = true,
}

-- disable persistence for certain directories
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = persistence_group,
  callback = function()
    local cwd = vim.fn.getcwd()
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin and not disabled_dirs[cwd] then
      require("persistence").load()
    else
      require("persistence").stop()
    end
  end,
  nested = true,
})

-- disable persistence if nvim started with stdin
vim.api.nvim_create_autocmd({ "StdinReadPre" }, {
  group = persistence_group,
  callback = function()
    vim.g.started_with_stdin = true
  end,
})
