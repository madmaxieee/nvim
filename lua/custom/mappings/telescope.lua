local telescope_mappings = {
  n = {
    ["<leader>ff"] = { "<cmd> Telescope git_files <CR>", "Find git files" },
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Search document symbols" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "Search marks" },
    ["<leader>fj"] = { "<cmd> Telescope jumplist <CR>", "Search jumplist" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>y"] = { "<cmd> Telescope neoclip <CR>", "Search clipboard history" },
  },
  v = {
    ["<leader>fw"] = {
      function()
        require("telescope.builtin").grep_string { path_display = { "shorten" } }
      end,
      "Grep string",
    },
  },
}

return telescope_mappings
