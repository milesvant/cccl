#!/bin/bash

source "$(dirname "$0")/build_common.sh"

CMAKE_OPTIONS="
    -DCCCL_ENABLE_THRUST=OFF \
    -DCCCL_ENABLE_LIBCUDACXX=OFF \
    -DCCCL_ENABLE_CUB=ON \
    -DCCCL_ENABLE_TESTING=OFF \
    -DCUB_ENABLE_DIALECT_CPP11=$(if [[ $CXX_STANDARD -ne 11 ]]; then echo "OFF"; else echo "ON"; fi) \
    -DCUB_ENABLE_DIALECT_CPP14=$(if [[ $CXX_STANDARD -ne 14 ]]; then echo "OFF"; else echo "ON"; fi) \
    -DCUB_ENABLE_DIALECT_CPP17=$(if [[ $CXX_STANDARD -ne 17 ]]; then echo "OFF"; else echo "ON"; fi) \
    -DCUB_ENABLE_DIALECT_CPP20=$(if [[ $CXX_STANDARD -ne 20 ]]; then echo "OFF"; else echo "ON"; fi) \
    -DTHRUST_IGNORE_DEPRECATED_CPP_DIALECT=ON \
    -DCUB_IGNORE_DEPRECATED_CPP_DIALECT=ON \
"

configure_and_build "CUB" "$CMAKE_OPTIONS"
