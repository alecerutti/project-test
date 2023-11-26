### >>> Uso main.cpp e printer.cpp
> cd ROOT
> gcc -I ./include/ -c src/main.cpp -o ./build/main.o
> gcc -c ./src/printer.cpp -o ./build/printer.o -I ./include/ 
> cd build/
> gcc -o MAIN_0 main.o printer.o -lstdc++
### <<<

### >>> Creo libreria statica 
> mkdir -p my_static_lib/build/ && cd my_static_lib
> g++ -c src/printer.cpp -I include/ -o build/printer.o 
> cd build/
> ar rs libmy_slibrary.a printer.o

> cd ROOT
> g++ -c src/main.cpp -o build/main.o -I my_static_lib/include/ -I include/
> # g++ -c src/printer.cpp -o build/printer.o -I include/
> g++ -o MAIN_1 main.o -L../my_static_library -lmy_slibrary
### <<<


### >>> Creo libreria dinamica
Creo object files con opzione fPIC:
> g++ -fPIC -c src/printer.cpp -o build/printer.o -I include/

Creo libreria dinamica a partire da object files:
> g++ -shared -Wl,-soname,libmy_dlibrary.so.1 -o libmy_dlibrary.so.1.0 printer.o

 
Osservazioni:
* -Wl: quelli che seguono sono comandi per il loader
* -soname: specifico soname (my_dlibrary.so.1)

Creo link a libreria (file di testo che ha stesso contenuto: è un alias). Punterò il linker a questo file. Il vantaggio è che, se deciderò di usare un'altra versione della libreria, non dovrò reindirizzare il linker alla nuova versione della libreria: dovrò solo ridefinire questo file-link facendolo puntare alla nuova libreria (automaticamente il linker verrà mandato alla nuova libreria).
 > ln -s libmy_dlibrary.so.1.0 libmy_dlibrary.so 
 
* Ora se compilo non ho errori (in main.cpp uso solo header di libdinamica)...
> cd ../../
> g++ src/main.cpp -o build/MAIN_3 -I my_dynamic_lib/include/ -L my_dynamic_lib/build/ -lmy_dlibrary

* ... Ma se runno no.
> ./MAIN_3 
error while loading shared libraries: libmy_dlibrary.so.1: cannot open shared object file: No such file or directory.

Infatti esaminando i soname della libreria (che gli abbiamo dato durante la creazione):
> ldd MAIN_3
libmy_dlibrary.so.1 => not found
Il loader non sa dove andare a trovare la libreria!

> 

### <<<
