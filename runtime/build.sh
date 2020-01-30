#!/bin/sh

wget https://www.antlr.org/download/antlr4-cpp-runtime-4.7.2-source.zip
unzip antlr4-cpp-runtime-4.7.2-source.zip
cd runtime
cmake .
make -j8
