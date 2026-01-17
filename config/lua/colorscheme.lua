-- Colorscheme

-- Custom provided base16 color scheme
local base16Colors = nixCats("base16Colors")
if base16Colors.enable then
  local color = base16Colors.palette
  require("mini.base16").setup({
    palette = {
      base00 = color.base00,
      base01 = color.base01,
      base02 = color.base02,
      base03 = color.base03,
      base04 = color.base04,
      base05 = color.base05,
      base06 = color.base06,
      base07 = color.base07,
      base08 = color.base08,
      base09 = color.base09,
      base0A = color.base0A,
      base0B = color.base0B,
      base0C = color.base0C,
      base0D = color.base0D,
      base0E = color.base0E,
      base0F = color.base0F,
    },
    use_cterm = true,
    plugins = { default = true },
  })
  return
end

if not nixCats('general') then
  return
end
-- Default color theme if nothing is provided
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = function()
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
      fg = "#928374",
      italic = true,
    })
  end,
})

vim.cmd("colorscheme gruvbox")
