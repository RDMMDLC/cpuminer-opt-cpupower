#!/bin/bash

#LOCAL_LIB="$HOME/usr/lib"

#export LDFLAGS="-L$LOCAL_LIB/curl/lib/.libs -L$LOCAL_LIB/gmp/.libs -L$LOCAL_LIB/openssl"

#F="--with-curl=$LOCAL_LIB/curl --with-crypto=$LOCAL_LIB/openssl --host=x86_64-w64-mingw32"

#sed -i 's/"-lpthread"/"-lpthreadGC2"/g' configure.ac

mkdir release


make distclean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=core-avx2 -msha -Wall" ./configure --with-curl
make -j 2
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-avx2-sha.exe

#make clean || echo clean
#CFLAGS="-O3 -march=corei7-avx -msha -Wall" ./configure
#make
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-avx-sha.exe

make clean || echo clean
rm -f config.status
CFLAGS="-O3 -march=core-avx2 -Wall" ./configure --with-curl
make -j 2
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-avx2.exe

#make clean || echo clean
#rm -f config.status
#CFLAGS="-O3 -march=znver1 -Wall" ./configure
#make -j 
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-aes-sha.exe


make clean || echo clean
rm -f config.status
CFLAGS="-O3 -march=corei7-avx -Wall" ./configure --with-curl
make -j 2
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-avx.exe

# -march=westmere is supported in gcc5
make clean || echo clean
rm -f config.status
CFLAGS="-O3 -march=westmere -Wall" ./configure --with-curl
#CFLAGS="-O3 -maes -msse4.2 -Wall" ./configure
make -j 2
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-aes-sse42.exe

#make clean || echo clean
#rm -f config.status
#CFLAGS="-O3 -march=corei7 -Wall" ./configure
#make 
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-sse42.exe

#make clean || echo clean
#rm -f config.status
#CFLAGS="-O3 -march=core2 -Wall" ./configure
#make 
#strip -s cpuminer.exe
#mv cpuminer.exe release/cpuminer-ssse3.exe
#make clean || echo clean

make clean || echo clean
rm -f config.status
CFLAGS="-O3 -msse2 -Wall" ./configure --with-curl
make -j 2
strip -s cpuminer.exe
mv cpuminer.exe release/cpuminer-sse2.exe
make clean || echo clean

