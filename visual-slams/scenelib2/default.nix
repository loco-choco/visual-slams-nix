{ stdenv,
  lib,
  boost,
  eigen,
  freeglut,
  glew,
  opencv,
  pangolin,
  fetchFromGitHub,
  cmake,
  pkg-config,
  extra-cmake-modules
}:
stdenv.mkDerivation rec {
  name = "SceneLib2";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "hanmekim";
    repo = name;
    rev = "39991c61becbebe0c66601fe5c14f8155264be4e";
    hash = "sha256-yU4TM/fQak8svidODVL8mxriEGun28U7gETNQ5uHfxY="; 
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

  buildInputs = [ 
    boost
    eigen
    freeglut
    glew
    opencv
    pangolin
  ];

  patches = [
    ./cmake.patch
    ./cmake-scenelib2.patch
    ./cv-consts.patch
    ];

  #installPhase = ''
  #  mkdir -p $out/include
  #  cp $src/scenelib2/monoslam.h $out/include
  #  mkdir -p $out/lib
  #  cp scenelib2/libscenelib2.so $out/lib
  #  mkdir -p $out/lib/cmake
  #  mkdir -p $out/lib/cmake/SceneLib2
  #  cp scenelib2/SceneLib2Config.cmake $out/lib/cmake/SceneLib2
  #'';
}
