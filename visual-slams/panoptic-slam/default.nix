{ stdenv, boost, freeglut, glew, pangolin, eigen, python3, opencv, librealsense
, fetchFromGitHub, cmake, pkg-config, extra-cmake-modules, openssl, cudaPackages
}:
let
  opencv-gtk = opencv.override { enableGtk2 = true; };
  python-env = python3.withPackages (ps:
    with ps; [
      numpy
      (opencv4.override { enableGtk2 = true; })
      easydict
      pyyaml
      (detectron2.override { torch = torchWithCuda; })
      torchWithCuda
      (torchvision.override { torch = torchWithCuda; })
      #(torch.override { cudaSupport = true; })
    ]);
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
    python-env
    eigen
    librealsense
    cudaPackages.cudatoolkit
    openssl
    opencv-gtk
    freeglut
    glew
    pangolin
  ];
}
