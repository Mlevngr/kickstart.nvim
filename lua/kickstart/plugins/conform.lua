return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    require('conform').setup {
      notify_on_error = false,
      format_on_save = nil,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
      },
    }

    local function conform_format_undojoin(bufnr)
      bufnr = bufnr or 0
      local ok, conform = pcall(require, 'conform')
      if not ok then
        return
      end
      pcall(function()
        vim.cmd 'silent! undojoin'
      end)
      conform.format { bufnr = bufnr, async = false, lsp_fallback = true }
    end

    local grp = vim.api.nvim_create_augroup('ConformFmtUndoJoin', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = grp,
      pattern = { '*.py', '*.lua' },
      callback = function(args)
        conform_format_undojoin(args.buf)
      end,
    })
  end,
}

