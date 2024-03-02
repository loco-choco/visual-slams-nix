{ stdenv,
  lib,
  boost,
  eigen,
  fetchFromGitLab,
  cmake,
  pkg-config,
  extra-cmake-modules
}:
stdenv.mkDerivation rec {
  pname = "basalt-headers";
  version = "main-2024-06-21";

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "mateosss";
    repo = pname;
    rev = "28b09b3a5802d44835655778cdd9b1974569bd47";
    hash = ""; 
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

  buildInputs = [ 
    boost
    eigen
  ];

  patches = [
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
