
if not nixCats('general') then
  return
end

require("blink.cmp").setup({
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- See :h blink-cmp-config-keymap for configuring keymaps
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },
  signature = { enabled = true, },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      path = {
        score_offset = 50,
      },
      lsp = {
        score_offset = 40,
      },
      snippets = {
        score_offset = 40,
      },
    },
  },
  snippets = {
    preset = "luasnip",
  },

  keymap = {
    preset = "default",
    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },

    ["<S-k>"] = { "scroll_documentation_up", "fallback" },
    ["<S-j>"] = { "scroll_documentation_down", "fallback" },

    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
  }

})
