#!/bin/bash

# Questo file crea MAIN_1 nella cartella build/
# Prima di runnare questo file:
#	- togli dal main.cpp le funzioni della lib dinamica
# 	- > chmod +x your_script.sh
# 	- > ./run_staticLib.sh

ROOT_FOLDER="$(dirname "$(realpath "$0")")"
cd "$ROOT_FOLDER"

mkdir -p build/

# Creo libreria
cd my_static_lib
gcc -c src/printer.cpp -I include/ -o build/printer.o
cd build
ar rs libmy_slibrary.a printer.o

# Creo eseguibile
cd "$ROOT_FOLDER"

gcc -c src/main.cpp -o build/main.o -I include/ -I my_static_lib/include/
gcc -c src/printer.cpp -o build/printer.o -I include/
cd build/
g++ -o MAIN_1 main.o printer.o -L../my_static_lib/build/ -lmy_slibrary
