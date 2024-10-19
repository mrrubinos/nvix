{ mkPkgs, inputs, ... }:
{
  extraPlugins = [
    (mkPkgs "template" inputs.template)
  ];
  extraConfigLua = # lua
    ''
      require('template').setup({
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
    '';
}
