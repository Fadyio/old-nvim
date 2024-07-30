--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.default,
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
    offsets = {
      {
        filetype = "NvimTree",
        text = "  Files",
        highlight = "StatusLine",
        text_align = "left",
      },
    },
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
