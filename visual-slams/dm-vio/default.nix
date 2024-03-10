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
  sophus,
  cereal_1_3_2,
  freeglut,
  glew,
  libGL,
  opencv,
  pangolin_0_6,
  basalt-headers,
  fetchFromGitHub,
  cmake,
  pkg-config,
  extra-cmake-modules
}:
stdenv.mkDerivation rec {
  pname = "dm-vio";
  version = "main-2023-06-06";

  src = fetchFromGitHub {
    owner = "lukasvst";
    repo = pname;
    rev = "3b5319aa4f0cf03b59bcb7573ee66861de1681df";
    hash = "";
  };

  nativeBuildInputs = [
    cmake
    cli11
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
    sophus
    cereal_1_3_2
    freeglut
    glew
    libGL
    opencv
    pangolin_0_6
  ];

  patches = [
  ];

  cmakeFlags = [
    #"-DBASALT_BUILTIN_EIGEN=OFF"
    #"-DBASALT_BUILTIN_SOPHUS=OFF"
    #"-DBASALT_BUILTIN_CEREAL=OFF"
    #"-DBASALT_BUILD_SHARED_LIBRARY_ONLY=TRUE"
  ];
}
