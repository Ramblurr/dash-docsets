nix build --impure --expr 'with import <nixpkgs> {}; systemd.overrideAttrs ({ mesonFlags, ... }: { mesonFlags = mesonFlags ++ [ "-Dhtml=enabled" ]; })'


