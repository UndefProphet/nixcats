if not nixCats('general') then
  return
end


require("snacks").setup({
  indent = {
    enabled = true,
    -- priority = 1,
    animate = {
      enabled = false,
    },
  },
})

