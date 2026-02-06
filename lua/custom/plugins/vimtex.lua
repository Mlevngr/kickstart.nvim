return {
  'lervag/vimtex',
  ft = { 'tex', 'plaintex' },
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-cd',
        '-lualatex',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-file-line-error',
        '-shell-escape',
      },
    }
    vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-lualatex' }
    vim.g.vimtex_view_forward_search_on_start = 1
  end,
}

