{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          zenn-cli
        ];

        shellHook = ''
          echo "Welcome to Zenn Article Develop Environment!"
          echo "These packages are enabled by flake."
          echo "  zenn-cli"
        '';
      };
    };
}
