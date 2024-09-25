{ stdenv, boost, freeglut, glew, pangolin, eigen, opencv, librealsense
, fetchFromGitHub, cmake, pkg-config, extra-cmake-modules, openssl}:
let opencv-gtk = opencv.override { enableGtk2 = true; };
in stdenv.mkDerivation (final: {
  name = "orbslam3";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "UZ-SLAMLab";
    repo = "ORB_SLAM3";
    rev = "v${final.version}-release";
    hash = "sha256-51ZPLrE5f5Zdqp6DJpg7OVzITBu+YJ4UTfwaycadIkw=";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules pkg-config ];

  buildInputs = [
    boost
    eigen
    librealsense
    openssl
    opencv-gtk
    freeglut
    glew
    pangolin
  ];
})
