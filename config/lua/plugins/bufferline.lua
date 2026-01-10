if not nixCats('general') then
  return
end

require("bufferline").setup({
  options = {
    -- close_command = function(n) Snacks.bufdelete(n) end,
    -- right_mouse_command = function(n) Snacks.bufdelete(n) end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,

    -- diagnostics_indicator = function(_, _, diag)
    --   local icons = LazyVim.config.icons.diagnostics
    --   local ret = (diag.error and icons.Error .. diag.error .. " " or "")
    --   .. (diag.warning and icons.Warn .. diag.warning or "")
    --   return vim.trim(ret)
    -- end,

    offsets = {
      {
        filetype = "neo-tree",
        text = "Tree",
        highlight = "Directory",
        text_align = "left",
      },
      {
        filetype = "snacks_layout_box",
      },
    },
  },

  -- config = function(_, opts)
  --   require("bufferline").setup(opts)
  --   -- Fix bufferline when restoring a session
  --   vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
  --     callback = function()
  --       vim.schedule(function()
  --         pcall(nvim_bufferline)
  --       end)
  --     end,
  --   })
  -- end,
})
