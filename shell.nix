{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell { buildInputs = with pkgs; [ alejandra git micro nix-update shfmt ]; }
