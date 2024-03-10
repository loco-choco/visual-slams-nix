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
	  basalt = pkgs.basalt;
	  basalt-headers = pkgs.basalt-headers;
	  opengv = pkgs.opengv;
	  pangolin_0_6 = pkgs.pangolin_0_6;
	  dm-vio = pkgs.dm-vio;
	  default = pkgs.scenelib2-example;
	};
      }
    ) // {
      overlay.visual-slam= import ./overlay.nix;
    };
}
