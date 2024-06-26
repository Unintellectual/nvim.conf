return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local lspStatus = {
      function()
        local msg = "No LSP detected"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = "",
      color = { fg = "#d3d3d3" },
    }

    local lsp_progress = {
      function()
        local lsp = vim.lsp.status()[1]
        if lsp then
          local name = lsp.name or ""
          local msg = lsp.message or ""
          local title = lsp.title or ""
          return string.format("%%<%s: %s %s (%s%%%%)", name, title, msg)
        end
        return ""
      end,
      color = { fg = "#d3d3d3" },
    }

    local buffer = {
      "buffers",
      mode = 0,
      show_filename_only = true,
      show_modified_status = true,
      hide_filename_extension = false,
      symbols = { alternate_file = "" },
      buffers_color = {
        active = { fg = "#d3d3d3" },
        inactive = { fg = "#414141" },
      },
    }

    local diagnostic = {
      "diagnostics",
      symbols = {
        error = " ",
        warn = " ",
        info = " ",
        hint = " ",
      },
      icon = "|",
    }

    local diff = {
      "diff",
      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "lazy" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { buffer },
        lualine_x = { lsp_progress, diff, diagnostic },
        lualine_y = { lspStatus, "filetype" },
        lualine_z = { "progress" },
      },
    }
  end,
}
