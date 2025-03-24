#!/usr/bin/env bash

export HTTP_PROXY="http://127.0.0.1:9999"
export HTTPS_PROXY="http://127.0.0.1:9999"
export http_proxy="http://127.0.0.1:9999"
export https_proxy="http://127.0.0.1:9999"
git config --global http.proxy "http://127.0.0.1:9999"
git config --global https.proxy "https://127.0.0.1:9999"

cd /opt && \
git clone https://github.com/deepseek-ai/3FS 3fs && \
cd /opt/3fs && \
git submodule update --init && \
./patches/apply.sh && \
cmake -S . -B build -DCMAKE_CXX_COMPILER=clang++-14 -DCMAKE_C_COMPILER=clang-14 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && \
cmake --build build -j 32