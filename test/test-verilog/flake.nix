{
    description = "Verilog HDL environment with Verilator and Yosys";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
    };

    outputs = { self, nixpkgs }: {
        defaultPackage.x86_64-linux = let
            pkgs = import nixpkgs { system = "x86_64-linux"; };
        in pkgs.mkShell {
            buildInputs = with pkgs; [
                verilator
                yosys
                iverilog
                gtkwave
            ];
        };
    };
}