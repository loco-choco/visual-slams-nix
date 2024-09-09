{ stdenv, boost, eigen, python312, python312Packages, opencv, freeglut
, librealsense, glew, pangolin, fetchFromGitHub, cmake, pkg-config
, extra-cmake-modules, openssl, cudaPackages }:
let pythonPackages = python312Packages;
in stdenv.mkDerivation {
  name = "panoptic-slam";
  version = "0-unstable-09-09-2024";

  src = fetchFromGitHub {
    owner = "loco-choco";
    repo = "Panoptic-SLAM";
    rev = "d1b4980e06365a1ba965922b6a23a61f2cde3192";
    hash = "sha256-yRRJCzuwxh7oGrWp/TFQihKx1Ka2i67nOnZvPPaIDJM=";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules pkg-config ];

  buildInputs = [
    boost
    python312
    pythonPackages.numpy
    eigen
    librealsense
    cudaPackages.cudatoolkit
    openssl
    opencv
    freeglut
    glew
    pangolin
  ];
}
