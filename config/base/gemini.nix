{ mkPkgs, inputs, ... }:
{
  extraPlugins = [
    (mkPkgs "gemini" inputs.gemini)
  ];
  extraConfigLua = # lua
    ''
      require('gemini').setup {
              configFilepath = '~/.config/gemini.nvim/config.json',
              timeout = 30 * 1000,
              model = 'gemini-1.5-pro-latest',
              safetyThreshold = 'BLOCK_ONLY_HIGH',
              stripOutermostCodeblock = function()
                return vim.bo.filetype ~= 'markdown'
              end,
              verbose = false
            }
 
    '';
}
