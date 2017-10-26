#!/bin/bash
set -ex
./configure --prefix=${PREFIX} \
            --host=${HOST} \
            CFLAGS="${CFLAGS} -I${PREFIX}/include" \
            LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"
make -j ${CPU_COUNT}
make install
make check
# This conflicts with a file in readline
rm -f ${PREFIX}/share/man/man3/history.3

