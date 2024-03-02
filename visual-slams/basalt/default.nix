{ stdenv,
  lib,
  boost,
  eigen,
  tbb_2021_8,
  fmt,
  bzip2,
  opengv,
  cli11,
  magic-enum,
  freeglut,
  glew,
  opencv,
  pangolin,
  fetchFromGitLab,
  cmake,
  pkg-config,
  extra-cmake-modules
}:
stdenv.mkDerivation rec {
  pname = "basalt";
  version = "main-2024-02-12";

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "mateosss";
    repo = pname;
    rev = "95dd2d7bc5fddaf893103fdc1d4fed687dcc327b";
    hash = "sha256-awKxKOJP9+qyQQCKBq+d8b1zLXLsBIeouigOoi9vnyE="; 
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

  buildInputs = [ 
    boost
    eigen
    tbb_2021_8
    fmt
    bzip2
    opengv
    cli11
    magic-enum
    freeglut
    glew
    opencv
    pangolin
  ];

  patches = [
    ./cmake.patch
  ];

  #installPhase = ''
  ##  mkdir -p $out/include
  #  cp $src/scenelib2/monoslam.h $out/include
  #  mkdir -p $out/lib
  #  cp scenelib2/libscenelib2.so $out/lib
  #  mkdir -p $out/lib/cmake
  #  mkdir -p $out/lib/cmake/SceneLib2
  #  cp scenelib2/SceneLib2Config.cmake $out/lib/cmake/SceneLib2
  #'';
}
