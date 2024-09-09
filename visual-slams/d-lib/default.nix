{
  lib,
  stdenv,
  boost,
  opencv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation rec {
  pname = "d-lib";
  version = "git";

  src = fetchFromGitHub {
    owner = "dorian3d";
    repo = "DLib";
    rev = "16ceae3e5e6bfcc67d52297f1b0ce9c0072bb0d4";
    hash = "sha256-48O2Pn7wbojjBGP/UQwmp4cfV+7W6NBPVJaTIYrwFTc=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    boost
    opencv
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  patches = [
    ./cmake.patch
  ];

  meta = with lib; {
    description = "C++ library with several utilities";
    homepage = "https://github.com/dorian3d/DLib";
    license = licenses.bsd3; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "d-lib";
    platforms = platforms.all;
  };
}
