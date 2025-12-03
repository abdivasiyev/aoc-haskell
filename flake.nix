{
  description = "Advent of Code Haskell Solutions";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    devshell,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        localSystem = {inherit system;};
        overlays = [
          devshell.overlays.default
        ];
      };
      hpkgs = pkgs.haskell.packages."ghc912";

      aocHaskell = pkgs.haskell.lib.overrideCabal (hpkgs.callCabal2nix "aoc-haskell" ./. {}) (old: {
        doCheck = true;
        doHaddock = false;
        enableLibraryProfiling = false;
        enableExecutableProfiling = false;
      });
    in {
      packages.default = aocHaskell;

      devShells.default = pkgs.devshell.mkShell {
        packages = [
          hpkgs.cabal-install
          hpkgs.cabal-add
          hpkgs.haskell-language-server
          hpkgs.fourmolu
          hpkgs.ghc
        ];
      };
    });
}
