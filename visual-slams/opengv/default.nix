{ lib
, stdenv
, eigen
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "opengv";
  version = "master-2020-08-06";

  src = fetchFromGitHub {
    owner = "laurentkneip";
    repo = pname;
    rev = "91f4b19c73450833a40e463ad3648aae80b3a7f3";
    hash = "";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    eigen
  ];

  cmakeFlakes = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/laurentkneip/opengv";
    license = licenses.none; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "g2o";
    platforms = platforms.all;
  };
}
