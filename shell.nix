{
  system ? "x86_64-linux",
  pkgs ? import <nixpkgs> { inherit system; },
}:
let
  packages = with pkgs; [
    dashing
    gnumake
    gnutar
  ];
in
pkgs.mkShell {
  buildInputs = packages;
  shellHook = ''
    export SHELL=${pkgs.zsh}
  '';
}
