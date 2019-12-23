#!/bin/bash

SCRIPT=$(readlink -f "$0" || grealpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

os=$(uname -s)
platform=""

case "$os" in
  Linux*)   platform="linux" ;;
  Darwin*)  platform="mac" ;; 
  *)        exit ;;
esac

architecture="x86"
arch=""

case "$architecture" in
  x86_64*)  arch="_64" ;;
  *)        arch="_32" ;;
esac

outputdir="$SCRIPTPATH/boost_1_58_0/build/$platform$arch"
echo $outputdir

cd "$SCRIPTPATH/boost_1_58_0"

folder="build/$platform$arch"
if [ ! -d $folder ]; then
update-alternatives --remove gcc /emsdk/upstream/emscripten/emcc
update-alternatives --remove g++ /emsdk/upstream/emscripten/em++
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
  ./bootstrap.sh --with-libraries=filesystem,system,date_time,regex
update-alternatives --remove gcc /usr/bin/gcc-5
update-alternatives --remove g++ /usr/bin/g++-5
update-alternatives --install /usr/bin/gcc gcc /emsdk/upstream/emscripten/emcc 20
update-alternatives --install /usr/bin/g++ g++ /emsdk/upstream/emscripten/em++ 20

   stage="stage"
   if [ -d $stage ]; then
     rm -R $stage
   fi

  mkdir -p "$folder"
  mkdir -p "$folder/static"
  mkdir -p "$folder/static_fpic"
  mkdir -p "$folder/shared"

  ./b2 --clean
  ./bjam link=static
  cp stage/lib/* "$folder/static/"

  ./b2 --clean
  ./bjam link=static cxxflags=-fPIC
  cp stage/lib/* "$folder/static_fpic/"

  ./b2 --clean
  ./bjam link=shared
  cp stage/lib/* "$folder/shared/"
fi
