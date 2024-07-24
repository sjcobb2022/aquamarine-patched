{
  lib,
  stdenv,
  cmake,
  hwdata,
  hyprutils,
  hyprwayland-scanner,
  libdisplay-info,
  libdrm,
  libffi,
  libGL,
  libinput,
  libseat,
  mesa,
  pixman,
  pkg-config,
  udev,
  wayland,
  wayland-protocols,
  version ? "git",
  doCheck ? false,

  ffmpeg,
  libliftoff,
  libpng,
  libcap,
  seatd,
  xorg,
}:
stdenv.mkDerivation {
  pname = "aquamarine";
  inherit version doCheck;
  src = ../.;

  nativeBuildInputs = [
    cmake
    hyprwayland-scanner
    pkg-config
    hwdata
  ];

  buildInputs = [
    hyprutils
    libdisplay-info
    libdrm
    libffi
    libGL
    libinput
    libseat
    mesa
    pixman
    udev
    wayland
    wayland-protocols

    libcap
    ffmpeg
    libliftoff
    libpng
    seatd
    xorg.libX11
    xorg.xcbutilerrors
    xorg.xcbutilimage
    xorg.xcbutilrenderutil
    xorg.xcbutilwm
  ];

  depsBuildBuild = [
    hwdata
    pkg-config
  ];

  outputs = ["out" "dev"];

  cmakeBuildType = "RelWithDebInfo";

  dontStrip = true;

  meta = {
    homepage = "https://github.com/hyprwm/aquamarine";
    description = "A very light linux rendering backend library";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}
