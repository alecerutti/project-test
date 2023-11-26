#!/bin/bash

# Prima di runnare questo .sh, togli dal main.cpp le funzioni delle librerie (qui non si usano)

ROOT_FOLDER="$(dirname "$(realpath "$0")")"
cd "$ROOT_FOLDER"

mkdir -p build/

gcc -I include/ -c src/main.cpp -o build/main.o
gcc -c src/printer.cpp -o build/printer.o -I include/

cd build/

g++ -o MAIN_0 main.o printer.o -lstdc++ # con gcc devo linkare stdlibrary (gcc -o MAIN_0 main.o printer.o -lstdc++)

# Per runnare questo file:
# > chmod +x your_script.sh
# > ./run_noLib.sh
