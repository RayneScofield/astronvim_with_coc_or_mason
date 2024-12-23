local M = {}
local system = vim.loop.os_uname().sysname

function M.core_mappings(mappings)
  if not mappings then mappings = require("astrocore").empty_map_table() end
  local maps = mappings
  if maps then
    maps.n["<Leader>n"] = false

    maps.n.n = { require("utils").better_search "n", desc = "Next search" }
    maps.n.N = { require("utils").better_search "N", desc = "Previous search" }

    maps.v["K"] = { ":move '<-2<CR>gv-gv", desc = "Move line up", silent = true }
    maps.v["J"] = { ":move '>+1<CR>gv-gv", desc = "Move line down", silent = true }

    if system == "Darwin" then
      maps.i["<D-s>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }
      maps.x["<D-s>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }
      maps.n["<D-s>"] = { "<Cmd>w<cr>", desc = "Save file", silent = true }
    end

    maps.n["n"] = { "nzz" }
    maps.n["N"] = { "Nzz" }

    -- close search highlight
    maps.n["<Leader>nh"] = { ":nohlsearch<CR>", desc = "Close search highlight", silent = true }

    maps.n["H"] = { "^", desc = "Go to start without blank" }
    maps.n["L"] = { "$", desc = "Go to end without blank" }

    maps.v["<"] = { "<gv", desc = "Unindent line" }
    maps.v[">"] = { ">gv", desc = "Indent line" }
    maps.t["<Esc>"] = { [[<C-\><C-n>]], desc = "Exit terminal mode" }

    -- @ray
    maps.n["<Tab>"] = { ":bnext<cr>",silent = true, desc = "Next buffer" }
    maps.n["<S-Tab>"] = { ":bprev<cr>", silent = true, desc= "Previous buffer" }
    maps.i["<C-z>"] = {"<C-o>:u<cr>", silent = true, desc = "Undo insert mode"}
    maps.i["<C-h>"] = { "<Left>", desc = "Move left" }
    maps.i["<C-l>"] = { "<Right>", desc = "Move right" }
    maps.i["<C-j>"] = { "<Down>", desc = "Move down" }
    maps.i["<C-k>"] = { "<Up>", desc = "Move up" }
    maps.x["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', silent = true }
    maps.n["X"] = { '"_X', silent = true }
    maps.n["d"] = { '"_d', silent = true }
    maps.n["D"] = { '"_D', silent = true }
    maps.v["d"] = { '"_d', silent = true }
    maps.v["D"] = { '"_D', silent = true }

    maps.i["<C-s>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }
    maps.x["<C-s>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }
    maps.n["<C-s>"] = { "<Cmd>w<cr>", desc = "Save file", silent = true }

    -- 在visual mode 里粘贴不要复制
    maps.n["x"] = { '"_x', desc = "Cut without copy" }

    maps.n["<Leader>bo"] = maps.n["<Leader>bc"]

    -- lsp restart
    maps.n["<Leader>lm"] = { "<Cmd>LspRestart<CR>", desc = "Lsp restart" }
    maps.n["<Leader>lg"] = { "<Cmd>LspLog<CR>", desc = "Show lsp log" }

    if vim.fn.executable "lazygit" == 1 then
      maps.n["<Leader>tl"] = {
        require("utils").toggle_lazy_git(),
        desc = "ToggleTerm lazygit",
      }
    end

    if vim.fn.executable "lazydocker" == 1 then
      maps.n["<Leader>td"] = {
        require("utils").toggle_lazy_docker(),
        desc = "ToggleTerm lazydocker",
      }
    end

    if vim.fn.executable "btm" == 1 then
      maps.n["<Leader>tt"] = {
        require("utils").toggle_btm(),
        desc = "ToggleTerm btm",
      }
    end
  end

  return maps
end

function M.lsp_mappings(mappings)
  if not mappings then mappings = require("astrocore").empty_map_table() end
  local maps = mappings
  if maps then
    maps.n["gK"] = false
    maps.n["gk"] = maps.n["<Leader>lh"]
  end
  return maps
end

return M
