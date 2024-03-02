{ stdenv,
  lib,
  boost,
  eigen,
  g20,
  dbow2,
  d-lib,
  opencv,
  freeglut,
  glew,
  pangolin,
  fetchFromGitHub,
  cmake,
  pkg-config,
  extra-cmake-modules
}:
stdenv.mkDerivation rec {
  name = "orbslam2";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "raulmur";
    repo = "ORB_SLAM2";
    rev = "f2e6f51cdc8d067655d90a78c06261378e07e8f3";
    hash = "sha256-19pY3nlVilVPXlMtKM4A8Z3cCZl/wkHQYqmvJohAYPg="; 
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

  buildInputs = [ 
    boost
    eigen
    g20
    dbow2
    d-lib
    opencv
    freeglut
    glew
    pangolin
  ];

  patches = [
    ./cmake.patch
    ./include.patch
    ./examples.patch
  ];
#   preConfigure = ''
#    export CMAKE_PREFIX_PATH="$src:$CMAKE_PREFIX_PATH"
#    echo $CMAKE_PREFIX_PATH
#  '';
  #buildPhase = ''
  #  sh $src/build.sh
  #'';

  #installPhase = ''
  #  mkdir -p $out/bin
  #  cp myprogram $out/bin
  #'';
}
