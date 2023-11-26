#!/bin/bash

ROOT_FOLDER="$(dirname "$(realpath "$0")")"
cd "$ROOT_FOLDER"
mkdir -p build/
cd build/ && rm -f libmy_dlibrary.so* && cd ..
mkdir -p my_dynamic_lib/build/

# Creo libreria
cd my_dynamic_lib/
g++ -fPIC -c src/printer.cpp -I include/ -o build/printer.o
cd build
g++ -shared -Wl,-soname,libmy_dlibrary.so.1 -o libmy_dlibrary.so.1.0 printer.o

# Creo fileTesto-link
ln -s $(pwd)/libmy_dlibrary.so.1.0 ../../build/libmy_dlibrary.so #linkname
ln -s $(pwd)/libmy_dlibrary.so.1.0 ../../build/libmy_dlibrary.so.1 #soname

# Creo eseguibile
cd "$ROOT_FOLDER"
cd build/
g++ ../src/main.cpp -o MAIN_3 -Wl,-rpath,. -I ../my_dynamic_lib/include/  -L . -lmy_dlibrary 

