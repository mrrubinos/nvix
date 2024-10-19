{ pkgs, ... }:
let
  template = pkgs.vimUtils.buildVimPlugin {
    name = "template";
    version = "0.0.1";
    src = pkgs.fetchFromGitHub {
      owner = "nvimdev";
      repo = "template.nvim";
      rev = "59955db23613985e031d340756d5c01aebd583a3";
      #      hash = "sha256-rQi/AOTFHkuysAknDaV6i3rtF2bwTRcEh4Tz0JXs6Qc=";
    };
  };
in {
  extraPlugins = [
    {
      plugin = template;
      config = 
          ''
            lua require('template').setup({
              temp_dir = '~/.local/share/nvim/templates',
              author = 'Miguel Rubinos',
              email = 'miguel@nomasystems.com',
              project = {
                ['erl'] = {
                  'application',
                  'common_test',
                  'escript',
                  'gen_event',
                  'gen_fsm',
                  'gen_server',
                  'gen_statem',
                  'header',
                  'library',
                  'supervisor'
                }
              }
            })
          ''
    }
  ];
}
