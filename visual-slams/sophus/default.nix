{ lib
, stdenv
, eigen
, fmt
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "sophus";
  version = "1.22.10";

  src = fetchFromGitHub {
    owner = "strasdat";
    repo = "Sophus";
    rev = version;
    hash = "sha256-TNuUoL9r1s+kGE4tCOGFGTDv1sLaHJDUKa6c9x41Z7w=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    eigen
    fmt
  ];

  cmakeFlags = [
    "-DBUILD_SOPHUS_TESTS=OFF"
    "-DBUILD_SOPHUS_EXAMPLES=OFF"
  ];

  meta = with lib; {
    description = "C++ implementation of Lie Groups using Eigen";
    homepage = "https://github.com/strasdat/Sophus";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "sophus";
    platforms = platforms.all;
  };
}
