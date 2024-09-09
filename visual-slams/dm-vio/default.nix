{
  stdenv,
  lib,
  boost,
  eigen,
  gtsam,
  tbb,
  yaml-cpp,
  libzip,
  suitesparse,
  opencv,
  freeglut,
  glew,
  pangolin_0_6,
  fetchFromGitHub,
  cmake,
  pkg-config,
  autoPatchelfHook,
  extra-cmake-modules,
}:
stdenv.mkDerivation rec {
  pname = "dm-vio";
  version = "main-2023-06-06";

  src = fetchFromGitHub {
    owner = "lukasvst";
    repo = "dm-vio";
    rev = "3b5319aa4f0cf03b59bcb7573ee66861de1681df";
    hash = "sha256-Qm7apT5aeZ5JLjO9BSHgbuVJgZxfq/DqGi5NZLDmRBI=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    autoPatchelfHook
  ];

  buildInputs = [
    boost
    eigen
    gtsam
    tbb
    yaml-cpp
    libzip
    suitesparse
    (opencv.override { enableGtk2 = true; })
    freeglut
    glew
    pangolin_0_6
  ];

  patches = [
    ./cmake.patch
    ./include.patch
  ];

  cmakeFlags = [
    #"-DBASALT_BUILTIN_EIGEN=OFF"
    #"-DBASALT_BUILTIN_SOPHUS=OFF"
    #"-DBASALT_BUILTIN_CEREAL=OFF"
    #"-DBASALT_BUILD_SHARED_LIBRARY_ONLY=TRUE"
  ];
}
