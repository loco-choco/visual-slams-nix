{ stdenv, boost, eigen, g20, dbow2, d-lib, opencv, freeglut, glew, pangolin
, fetchFromGitHub, cmake, pkg-config, extra-cmake-modules, }:
stdenv.mkDerivation {
  name = "panoptic-slam";
  version = "0-unstable-23-05-2024";

  src = fetchFromGitHub {
    owner = "iit-DLSLab";
    repo = "Panoptic-SLAM";
    rev = "e3f9e56d867c36cd3100ce31151d50ebaaa98de7";
    hash = "sha256-rMNQrjUJZ1Xx8MqPVQ81q9vqQwIBVx/615uoue2A7lM=";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules pkg-config ];

  buildInputs = [ boost eigen g20 dbow2 d-lib opencv freeglut glew pangolin ];
}
