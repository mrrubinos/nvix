{ pkgs, ... }:
let
  erlang_ls = pkgs.vimUtils.buildVimPlugin {
    name = "erlang_ls";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "erlang-ls";
      repo = "erlang_ls";
      rev = "01b4afe7e8f5ed4d049b4a0e11c06f72e8157c6d";
      hash = "sha256-rQi/AOTFHkuysAknDaV6i3rtF2bwTRcEh4Tz0JXs6Qc=";
    };
  };
in {
  extraPlugins = [
    {
      plugin = erlang_ls;
      config = "lua require'lspconfig'.erlangls.setup{}";
    }
  ];
}
