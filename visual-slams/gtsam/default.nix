{ lib
, stdenv
, eigen
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gtsam";
  version = "4.2";

  src = fetchFromGitHub {
    owner = "laurentkneip";
    repo = "gtsam";
    rev = finalAttrs.version;
    hash = "";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    eigen
  ];

  cmakeFlakes = [
  ];

  meta = {
    description = "A library of C++ classes that implement smoothing and mapping (SAM) in robotics and vision";
    homepage = "https://gtsam.org/";
    license = lib.licenses.none; 
    maintainers = [ lib.maintainers.locochoco ];
    platforms = lib.platforms.all;
  };
})
