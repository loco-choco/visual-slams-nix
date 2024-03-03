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
  pangolin,
  basalt-headers,
  fetchFromGitLab,
  fetchFromGitHub,
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

  headers-src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "mateosss";
    repo = "basalt-headers";
    rev = "28b09b3a5802d44835655778cdd9b1974569bd47";
    hash = "sha256-gCHCB/1hEy3R/MGexdbq3tIz30Ciw2QmmAqz5wjKhM0="; 
  };

  postUnpack = ''
    rm -r source/thirdparty/basalt-headers
    ln -s ${headers-src} source/thirdparty/basalt-headers
  '';

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
    pangolin
    #(pangolin.overrideAttrs(finalAttrs: previousAttrs: {
    #  version="0.6.0";
    #  src = fetchFromGitHub {
    #    owner = "stevenlovegrove";
    #    repo = "Pangolin";
    #    rev = "86eb4975fc4fc8b5d92148c2e370045ae9bf9f5d";
    #    sha256 = "sha256-fKteOuOuGMWPZFxOUGCUcjeLXtTUXSGMSs1QfM5qblU=";
    #  };
    #}))
  ];

  patches = [
    ./cmake.patch
    ./cmake-thirdparty.patch
    ./cmake-thirdparty-apriltag.patch
  ];

  cmakeFlags = [
    "-DBASALT_BUILTIN_EIGEN=OFF"
    "-DBASALT_BUILTIN_SOPHUS=OFF"
    "-DBASALT_BUILTIN_CEREAL=OFF"
    "-DHAVE_GLEW=ON"
    "-DBASALT_BUILD_SHARED_LIBRARY_ONLY=TRUE"
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
