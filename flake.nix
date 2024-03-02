{
  description = "A Nix flake for some Visual Slam Libs";
  inputs = {
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };
  outputs = { self, flake-utils, flake-compat, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
	  overlays = [ self.overlay.visual-slam ];
	};
      in rec {
        packages = rec {
	  scenelib2 = pkgs.scenelib2;
	  scenelib2-example = pkgs.scenelib2-example;
	  g20 = pkgs.g20;
	  d-lib = pkgs.d-lib;
	  dbow2 = pkgs.dbow2;
	  orbslam2 = pkgs.orbslam2;
	  sophus = pkgs.sophus;
	  dso = pkgs.dso;
	  default = pkgs.ltspice;
	};
      }
    ) // {
      overlay.visual-slam= import ./overlay.nix;
    };
}
