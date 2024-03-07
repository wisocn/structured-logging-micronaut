{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }: {

    devShell.aarch64-darwin = let
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        # choose our preferred jdk package
        jdk = pkgs.jdk21;
    in pkgs.mkShell {
        buildInputs = with pkgs; [
          jdk
          just
          curl
          # customise gradle
          (callPackage gradle-packages.gradle_8 {
            java = jdk;
          })
        ];
    };
  };
}
