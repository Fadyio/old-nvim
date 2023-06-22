--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end
local mode_icons = {
  ["n"] = "🄽",
  ["no"] = "🄽",
  ["nov"] = "🄽",
  ["noV"] = "🄽",
  ["niI"] = "🄽",
  ["niR"] = "🄽",
  ["niV"] = "🄽",
  ["v"] = "🅅",
  ["V"] = "🅅",
  ["s"] = "🅂",
  ["S"] = "🅂",
  ["i"] = "🄸",
  ["ic"] = "🄸",
  ["ix"] = "🄸",
  ["R"] = "🅁",
  ["Rc"] = "🅁",
  ["Rv"] = "🅁",
  ["Rx"] = "🅁",
  ["r"] = "🅁",
  ["rm"] = "🅁",
  ["r?"] = "🅁",
  ["c"] = "🄲",
  ["cv"] = "🄲",
  ["ce"] = "🄲",
  ["!"] = "🅃",
  ["t"] = "🅃",
  ["nt"] = "🅃",
}

local function get_mode()
  local mode = vim.api.nvim_get_mode().mode
  if mode_icons[mode] == nil then
    print(mode)
    return mode
  end

  return mode_icons[mode] .. " "
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", hint = " ", info = " " },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local location = {
  "location",
  padding = 0,
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
    globalstatus = true,
    disabled_filetypes = { "alpha", "dashboard" },
  },
  sections = {
    lualine_a = { get_mode },
    lualine_b = { "branch", diff, diagnostics },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", filetype },
    lualine_y = { '"  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))' },
    lualine_z = { "location", "progress" },
  },
  tabline = {},
  extensions = {},
})
