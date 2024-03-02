{ lib
, stdenv
, eigen
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "g2o";
  version = "git";

  src = fetchFromGitHub {
    owner = "RainerKuemmerle";
    repo = "g2o";
    rev = "d0f7020719d5077a5cec21f8504bbe7c4bfdba3a";
    hash = "sha256-mHzexFigPDU2zllnCRDI30sUooypiSdZiHtLnyA658w=";
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
    description = "G2o: A General Framework for Graph Optimization";
    homepage = "https://github.com/RainerKuemmerle/g2o";
    license = licenses.bsd3; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "g2o";
    platforms = platforms.all;
  };
}
