{
  lib,
  stdenv,
  boost,
  opencv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation rec {
  pname = "dbow2";
  version = "git";

  src = fetchFromGitHub {
    owner = "dorian3d";
    repo = "DBoW2";
    rev = "3924753db6145f12618e7de09b7e6b258db93c6e";
    hash = "sha256-yzH0xZpLbSQE85GQol6l9xjIx12XSREmDvjkWulntZc=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    boost
    opencv
  ];

  cmakeFlags = [
    "-DBUILD_Demo=OFF"
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  patches = [
    ./cmake.patch
  ];

  meta = with lib; {
    description = "Enhanced hierarchical bag-of-word library for C";
    homepage = "https://github.com/dorian3d/DBoW2";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
    mainProgram = "dbow2";
    platforms = platforms.all;
  };
}
