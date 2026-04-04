{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    byond-linux = {
      type = "tarball";
      url = "https://www.byond.com/download/build/516/516.1680_byond_linux.zip";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    byond-linux,
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };

    byond_ver = "516";
    byond_build = "1680";
  in {
    # taken from https://github.com/Exxion/byond-linux-flake/
    # there's a better way to be doing this, but i really just want byond working right now
    packages.i686-linux.byond-linux = with import nixpkgs {
      config.allowUnfree = true;
      system = "i686-linux";
    };
      stdenv.mkDerivation rec {
        pname = "byond-linux";
        version = "${byond_ver}.${byond_build}";
        src = "${byond-linux}";

        nativeBuildInputs = [autoPatchelfHook];

        buildInputs = [gcc-unwrapped glibc curl];

        buildPhase = " ";

        installPhase = ''
          mkdir -p $out
          cp -a * $out
          cd $out/bin
        '';

        meta = with lib; {
          #Is this even useful in a flake?
          description = "Linux tools for the BYOND game engine.";
          homepage = "https://www.byond.com/";
          platforms = ["i686-linux"];
        };
      };

    packages.x86_64-linux.byond-linux = self.packages.i686-linux.byond-linux;

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        self.packages.x86_64-linux.byond-linux
        # we'll just run build.js from tools/build instead
        just
        nodejs
      ];
    };
  };
}
