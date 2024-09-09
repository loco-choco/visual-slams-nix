{
  stdenv,
  lib,
  boost,
  eigen,
  freeglut,
  glew,
  opencv,
  pangolin,
  scenelib2,
  fetchFromGitHub,
  cmake,
  pkg-config,
  extra-cmake-modules,
}:
stdenv.mkDerivation rec {
  name = "SceneLib2-example";
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
    scenelib2
  ];

  patches = [
    ./cmake.patch
    ./cmake-example.patch
    ./example.patch
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp examples/MonoSlamSceneLib1 $out/bin/scenelib2-example
  '';
}
