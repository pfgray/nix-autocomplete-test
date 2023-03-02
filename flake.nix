{
  description = "simple env";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
  };

  outputs = { self, flake-utils, nixpkgs, ... }:
    let
      systemAttrs = flake-utils.lib.eachDefaultSystem (system:
        let 
          pkgs = nixpkgs.legacyPackages.${system};
          dothis = pkgs.callPackage ./dothis.nix {};
        in {
          devShell = pkgs.mkShell {
            packages = [
              dothis
            ];
          };
          packages = {
            dothis = dothis;
          };
        });
    in systemAttrs;
}