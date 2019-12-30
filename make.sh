# make sure the is a ranlib on libboost
/emsdk/upstream/bin/llvm-ranlib /core/Common/3dParty/boost/boost_1_58_0/build/linux_32/static/libboost_regex.a
make x2t
cp ./build/bin/linux_32/x2t ./build/bin/linux_32/x2t.bc
gcc -Wl,--no-check-features -O0 -s USE_ICU=1 -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s USE_PTHREADS=1 -s EXTRA_EXPORTED_RUNTIME_METHODS=["ccall"] -s EXPORT_ALL=1 -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s TOTAL_MEMORY=149880832 -s WASM=1 ./build/bin/linux_32/x2t.bc ./build/lib/linux_32/libCryptoPPLib.a ./build/lib/linux_32/libXlsFormatLib.a ./build/lib/linux_32/libkernel.so ./build/lib/linux_32/libgraphics.so ./build/lib/linux_32/libUnicodeConverter.so ./Common/3dParty/boost/boost_1_58_0/stage/lib/libboost_regex.a -lnodefs.js -o x2t.js
#gcc -Wl,--no-check-features -O0 -s USE_PTHREADS=1 -s USE_ICU=1 -s EXTRA_EXPORTED_RUNTIME_METHODS=["ccall"] -s EXPORT_ALL=1 -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s TOTAL_MEMORY=149880832 -s WASM=1 ./build/bin/linux_32/x2t.bc ./build/lib/linux_32/libCryptoPPLib.a ./build/lib/linux_32/libXlsFormatLib.a ./build/lib/linux_32/libkernel.so ./build/lib/linux_32/libgraphics.so ./build/lib/linux_32/libUnicodeConverter.so ./Common/3dParty/boost/boost_1_58_0/stage/lib/libboost_regex.a ./Common/3dParty/icu/linux_32/build/libicudata.a -lnodefs.js -o x2t.js

