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
    hash = "sha256-LfnylJ9NCHlqjT76Tgku4NwxULJ+WDAcJQ2lDKGWSI4=";
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
    description = "OpenGV is a collection of computer vision methods for solving geometric vision problems. It is hosted and maintained by the Mobile Perception Lab of ShanghaiTech. ";
    homepage = "https://github.com/laurentkneip/opengv";
    #license = licenses.none; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ locochoco ];
    platforms = platforms.all;
  };
}
