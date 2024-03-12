{ lib
, stdenv
, boost
, eigen
, tbb
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gtsam";
  version = "4.2";

  src = fetchFromGitHub {
    owner = "borglab";
    repo = "gtsam";
    rev = finalAttrs.version;
    hash = "sha256-HjpGrHclpm2XsicZty/rX/RM/762wzmj4AAoEfni8es=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    boost
    eigen
    tbb
    #mkl #make this optional 
  ];

  cmakeFlags = [
    (lib.cmakeBool "GTSAM_USE_SYSTEM_EIGEN" true)
  ];

  meta = {
    description = "A library of C++ classes that implement smoothing and mapping (SAM) in robotics and vision";
    homepage = "https://gtsam.org/";
    license = lib.licenses.bsd3; 
    maintainers = [ lib.maintainers.locochoco ];
    platforms = lib.platforms.all;
  };
})
