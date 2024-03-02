{ lib
, stdenv
, suitesparse
, eigen
, boost
, libzip
, pangolin
, opencv
, fmt
, sophus
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "dso";
  version = "unstable-2021-03-08";

  src = fetchFromGitHub {
    owner = "JakobEngel";
    repo = "dso";
    rev = "7b0c99f01d238f801c625beaff90240bcb007198";
    hash = "sha256-jwRgNp4DuFdzmuCRjm47bnXonA4Y/gdbdZyRBbwJV7g=";
  };

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    suitesparse
    eigen
    boost
    libzip
    opencv
    fmt
    sophus
  ];

  patches = [
    ./cmake.patch
    ./include.patch
  ];

  meta = with lib; {
    description = "Direct Sparse Odometry";
    homepage = "https://github.com/JakobEngel/dso/tree/master";
    changelog = "https://github.com/JakobEngel/dso/blob/${src.rev}/CHANGELOG";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "dso";
    platforms = platforms.all;
  };
}
