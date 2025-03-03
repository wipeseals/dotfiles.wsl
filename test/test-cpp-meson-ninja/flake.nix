{
    description = "A flake for building C++ projects with Meson and Ninja";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: {
        packages.default = let
            pkgs = import nixpkgs { inherit system; };
        in pkgs.mkShell {
            buildInputs = [
                pkgs.meson
                pkgs.ninja
                pkgs.gcc
            ];
        };
    });
}