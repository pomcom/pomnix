{ inputs, lib, pkgs, config, outputs, ... }:
{
  imports = [
    ./c.nix
    ./go.nix
    ./lua.nix
    /* ./java.nix */
    ./js.nix
    ./python.nix
    ./rust.nix
    ./typst.nix
    ./jekyll.nix
  ];
}
