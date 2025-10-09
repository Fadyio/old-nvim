require("bufferline").setup({
  options = {
    mode = "buffers",
    style_preset = require("bufferline").style_preset.default,
    numbers = "ordinal",
    modified_icon = "",
    buffer_close_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_prefix_length = 15,
    max_name_length = 14,
    tab_size = 14,
    color_icons = true,
    separator_style = "slope",
    show_close_icon = false,

    custom_areas = {
      left = function()
        return {
          { text = "  ", fg = "#8fff6d" },
        }
      end,
    },
  },
})
