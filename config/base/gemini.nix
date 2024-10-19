{ pkgs, ... }:
let
  gemini = pkgs.vimUtils.buildVimPlugin {
    name = "gemini";
    version = "0.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "meinside";
      repo = "gemini.nvim";
      rev = "59955db23613985e031d340756d5c01aebd583a3";
      #      hash = "sha256-rQi/AOTFHkuysAknDaV6i3rtF2bwTRcEh4Tz0JXs6Qc=";
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
          ''
    }
  ];
}
