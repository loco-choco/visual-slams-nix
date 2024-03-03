{ stdenv, lib, fetchFromGitHub, cmake, pkg-config, doxygen, glew
, xorg, ffmpeg_4, libjpeg, libpng, libtiff, eigen
, Carbon ? null, Cocoa ? null
}:

stdenv.mkDerivation rec {
  pname = "pangolin";

  version = "v0.6";

  src = fetchFromGitHub {
    owner = "stevenlovegrove";
    repo = "Pangolin";
    rev = "86eb4975fc4fc8b5d92148c2e370045ae9bf9f5d";
    sha256 = "sha256-fKteOuOuGMWPZFxOUGCUcjeLXtTUXSGMSs1QfM5qblU=";
  };

  nativeBuildInputs = [ cmake pkg-config doxygen ];

  buildInputs = [
    glew
    xorg.libX11
    ffmpeg_4
    libjpeg
    libpng
    libtiff
    eigen
  ]
  ++ lib.optionals stdenv.isDarwin [ Carbon Cocoa ];

  # The tests use cmake's findPackage to find the installed version of
  # pangolin, which isn't what we want (or available).
  doCheck = false;
  cmakeFlags = [ "-DBUILD_TESTS=OFF" "-DHAVE_GLEW=ON" ];

  patches = [
    ./cstdint.patch
    #./opengl.patch
  ];

  meta = {
    description = "A lightweight portable rapid development library for managing OpenGL display / interaction and abstracting video input";
    longDescription = ''
      Pangolin is a lightweight portable rapid development library for managing
      OpenGL display / interaction and abstracting video input. At its heart is
      a simple OpenGl viewport manager which can help to modularise 3D
      visualisation without adding to its complexity, and offers an advanced
      but intuitive 3D navigation handler. Pangolin also provides a mechanism
      for manipulating program variables through config files and ui
      integration, and has a flexible real-time plotter for visualising
      graphical data.
    '';
    homepage = "https://github.com/stevenlovegrove/Pangolin";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.expipiplus1 ];
    platforms = lib.platforms.all;
  };
}

