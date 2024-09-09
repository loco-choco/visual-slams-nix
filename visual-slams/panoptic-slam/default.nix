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
    rev = "3305ca80df5b6b90c55d4e5e42eab525b6377960";
    hash = "sha256-gxHjaGC/KU9q6H+KQE74CQdZXiqZUSOxYHlE72HBxw8=";
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
