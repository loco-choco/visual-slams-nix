{ stdenv,
  lib,
  boost,
  eigen,
  sophus,
  fmt,
  cereal_1_3_2,
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
    hash = "sha256-gCHCB/1hEy3R/MGexdbq3tIz30Ciw2QmmAqz5wjKhM0="; 
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
  ];

  buildInputs = [ 
    boost
    eigen
    sophus
    fmt
    cereal_1_3_2
  ];

  patches = [
    ./cmake-install.patch
  ];

  cmakeFlags = [
    "-DBASALT_BUILTIN_EIGEN=OFF"
    "-DBASALT_BUILTIN_SOPHUS=OFF"
    "-DBASALT_BUILTIN_CEREAL=OFF"
  ];

  #installPhase = ''
    #ls -a
   # ls -a ${fmt.src}
   # cat ${fmt.src}/README.rst
   # dsa
  #  mkdir -p $out/include
  #  cp $src/scenelib2/monoslam.h $out/include
  #  mkdir -p $out/lib
  #  cp scenelib2/libscenelib2.so $out/lib
  #  mkdir -p $out/lib/cmake
  #  mkdir -p $out/lib/cmake/SceneLib2
  #  cp scenelib2/SceneLib2Config.cmake $out/lib/cmake/SceneLib2
 # '';
}
