{ pkgs, ... }:
let
  gemini = pkgs.vimUtils.buildVimPlugin {
    name = "gemini";
    version = "0.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "meinside";
      repo = "gemini.nvim";
      rev = "d1ec0f732a25b6f38c6d87f6c8677f2f2a7ac6ae";
      hash = "sha256-SsTqdOve0uAP9fApBSVIUj0JIOjneQD02CXbA0dRCWo=";
    };
  };
in {
  extraPlugins = [
    {
      plugin = gemini;
      config = 
          ''
            lua require('gemini').setup {
              configFilepath = '~/.config/gemini.nvim/config.json',
              timeout = 30 * 1000,
              model = 'gemini-1.5-pro-latest',
              safetyThreshold = 'BLOCK_ONLY_HIGH',
              stripOutermostCodeblock = function()
                return vim.bo.filetype ~= 'markdown'
              end,
              verbose = false,
            }
          '';
    }
  ];
}
