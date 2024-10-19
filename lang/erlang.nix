{ mkPkgs, inputs, ... }:
{
  extraPlugins = [
    (mkPkgs "erlang_ls" inputs.erlang_ls)
  ];
  extraConfigLua = # lua
    ''
     require('lspconfig').erlangls.setup{} 
    '';
}
