make x2t
cp ./build/bin/linux_32/x2t ./build/bin/linux_32/x2t.bc
gcc -s ERROR_ON_UNDEFINED_SYMBOLS=0 -s TOTAL_MEMORY=149880832 -s WASM=1 ./build/bin/linux_32/x2t.bc ./build/lib/linux_32/libCryptoPPLib.a ./build/lib/linux_32/libXlsFormatLib.a ./build/lib/linux_32/libkernel.so ./Common/3dParty/boost/boost_1_58_0/stage/lib/libboost_regex.a -pthread -o x2t.js
