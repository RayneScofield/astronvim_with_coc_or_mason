vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.conceallevel = 2
vim.opt.list = false
vim.opt.listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }
vim.opt.showbreak = "↪ "
vim.opt.splitkeep = "screen"
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.scrolloff = 5
vim.opt.winwidth = 10
vim.opt.winminwidth = 10
vim.opt.equalalways = false
vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]

-- @ray
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.jumpoptions = "stack"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.autoformat = false
vim.g.trouble_lualine = true
-- @ray
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enable = 0,
}
vim.g.have_nerd_font = true

vim.o.laststatus = 3

if vim.fn.has "nvim-0.10" == 1 then
  vim.opt.smoothscroll = true
  vim.opt.foldexpr = "v:lua.require'utils.ui'.foldexpr()"
  vim.opt.foldmethod = "expr"
  vim.opt.foldtext = ""
else
  vim.opt.foldmethod = "indent"
  vim.opt.foldtext = "v:lua.require'utils.ui'.foldtext()"
end
