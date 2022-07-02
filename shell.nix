{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell { buildInputs = with pkgs; [ git micro nixfmt nix-update shfmt ]; }
