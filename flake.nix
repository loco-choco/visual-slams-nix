{
  description = "A Nix flake for some Visual Slam Libs";
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/master"; };
  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
          overlays = [ self.overlay.visual-slam ];
        };
      in {
        packages = {
          scenelib2 = pkgs.scenelib2;
          scenelib2-example = pkgs.scenelib2-example;
          g20 = pkgs.g20;
          d-lib = pkgs.d-lib;
          dbow2 = pkgs.dbow2;
          orbslam2 = pkgs.orbslam2;
          dso = pkgs.dso;
          basalt = pkgs.basalt;
          pangolin_0_6 = pkgs.pangolin_0_6;
          dm-vio = pkgs.dm-vio;
          gtsam = pkgs.gtsam;
          default = pkgs.scenelib2-example;
        };
      }) // {
        overlay.visual-slam = import ./overlay.nix;
      };
}
