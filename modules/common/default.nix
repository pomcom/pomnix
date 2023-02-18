{ pkgs, ... }:

let
  nvim = import ./nvim;
in
{
  environment.systemPackages = [
    nvim
  ];
}

