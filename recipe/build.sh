#!/bin/sh

mkdir build && cd build

cmake \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  ..

make generate_docstrings
make install -j${CPU_COUNT}
DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib ctest -R pyinstallcheck --output-on-failure -j${CPU_COUNT}

