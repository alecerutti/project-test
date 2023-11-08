cmake_minimum_required(VERSION 3.13)

project(cmake-test)

### >>> Uso main.cpp e printer.cpp
add_executable(${PROJECT_NAME} src/main.cpp src/printer.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC include) # Posizione printer.h (gcc -I)
### <<<

### >>> Uso libreria statica
add_subdirectory(my_static_lib) # Aggiungo cartella contenente un altro CMakeLists.txt (my_static_lib/CMakeLists.txt), in cui creo la libreria (archivio.a).

target_include_directories(${PROJECT_NAME} PUBLIC my_static_lib/include) # Dico dove trovare header (gcc -I)

# target_link_directories(${PROJECT_NAME} PRIVATE path/to/lib) # Posizione my_slibrary.a (gcc -L), creata grazie a my_static_lib/CMakeLists.txt.
# In questo caso è un comando opzionale in quanto la libreria in questione non la stiamo importando da fuori (ex: non è in una cartella sul Desktop), ma la stiamo
# appunto creando con CMake partendo dai *cpp. Di conseguenza, avendola creata con Cmake, Cmake stesso sa dove andarla a trovare (in cmake-test/build/, vedi 
# commenti in my_static_lib/CMakeLists.txt per capire il motivo). 

target_link_libraries(${PROJECT_NAME} my_slibrary) # Libreria senza 'lib' (gcc -l)
### <<< 

### >>> Uso libreria dinamica
add_subdirectory(my_dynamic_lib)
target_include_directories(${PROJECT_NAME} PUBLIC my_dynamic_lib/include) # (gcc -I)
# target_link_directories(${PROJECT_NAME} PRIVATE path/to/lib) # (gcc -L)
target_link_libraries(${PROJECT_NAME} my_dlibrary) # (gcc - l)
### <<<
