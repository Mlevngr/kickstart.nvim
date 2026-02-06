return {
  dir = vim.fn.stdpath 'config',
  name = 'theme-selector',
  lazy = false,
  priority = 1000,
  config = function()
    local function try_colorscheme(scheme)
      local ok = pcall(vim.cmd.colorscheme, scheme)
      if ok then
        return true
      end

      local ok_lazy, lazy = pcall(require, 'lazy')
      if not ok_lazy then
        return false
      end

      local load_by_scheme = {
        ['tokyonight'] = 'tokyonight.nvim',
        ['catppuccin'] = 'catppuccin',
        ['gruvbox'] = 'gruvbox.nvim',
        ['onedark'] = 'onedark.nvim',
        ['everforest'] = 'everforest',
      }

      local key = scheme:match('^([%w_]+)') or scheme
      local plugin_name = load_by_scheme[key]
      if plugin_name then
        pcall(lazy.load, { plugins = { plugin_name } })
      end

      return pcall(vim.cmd.colorscheme, scheme)
    end

    local function apply_overrides()
      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#3b3f51' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true })
    end

    local function set_theme(scheme)
      if not scheme or scheme == '' then
        return
      end

      if try_colorscheme(scheme) then
        apply_overrides()
        vim.g.colorscheme = scheme
        return true
      end

      vim.notify(('Colorscheme not found: %s'):format(scheme), vim.log.levels.WARN)
      return false
    end

    vim.api.nvim_create_user_command('Theme', function(opts)
      if opts.args == '' then
        vim.notify(('Current colorscheme: %s'):format(vim.g.colors_name or 'none'))
        return
      end
      set_theme(opts.args)
    end, {
      nargs = '?',
      complete = 'color',
      desc = 'Set colorscheme (auto-load theme plugin if possible)',
    })

    local scheme = vim.g.colorscheme or vim.env.NVIM_THEME or 'tokyonight-moon'
    set_theme(scheme)
  end,
}

