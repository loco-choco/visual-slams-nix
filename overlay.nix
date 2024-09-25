final: prev: {
  scenelib2 = final.pkgs.callPackage ./visual-slams/scenelib2 { };
  scenelib2-example =
    final.pkgs.callPackage ./visual-slams/scenelib2-example { };
  g20 = final.pkgs.callPackage ./visual-slams/g20 { };
  d-lib = final.pkgs.callPackage ./visual-slams/d-lib { };
  dbow2 = final.pkgs.callPackage ./visual-slams/dbow2 { };
  orbslam2 = final.pkgs.callPackage ./visual-slams/orbslam2 { };
  orbslam3 = final.pkgs.callPackage ./visual-slams/orbslam3 { };
  dso = final.pkgs.callPackage ./visual-slams/dso { };
  basalt = final.pkgs.callPackage ./visual-slams/basalt { };
  panoptic-slam = final.pkgs.callPackage ./visual-slams/panoptic-slam { };
  pangolin_0_6 = final.pkgs.callPackage ./visual-slams/pangolin_0_6 { };
  dm-vio = final.pkgs.callPackage ./visual-slams/dm-vio { };
  gtsam = final.pkgs.callPackage ./visual-slams/gtsam { };
}
