cmake_minimum_required(VERSION 3.13)

project(my_dynamic_lib)

# Creiamo libreria libmy_dlibrary.so
add_library(my_dlibrary SHARED src/printer.cpp) # (g++ -fPIC -c printer.cpp -o printer.o; g++ -shared -Wl,-soname,my_dlibrary.so.1 -o my_dlibrary.so.1.0 printer.o)
# Dove la crea? Ecco cosa succede:
# In cmake-test/ facciamo "> cmake -S . -B build/": cmake-test/CMakeLists.txt viene processato e i file di output messi in cmake-test/build.
# In cmake-test/CMakeLists.txt c'è comando "add_subdirectory(my_dynamic_lib)" che reindirizza qui: questo CMakeLists.txt viene quindi letto e processato.  
# I files di output abbiamo detto essere in cmake-test/build. Facendo lì "> make", lì è dove verranno messi tutti i files di build.
# Quindi dove sarà libmy_dlibrary.so? In cmake-test/build!

target_include_directories(my_dlibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)  # Posizione printer.h (gcc - I).
# Perché metto target_include_directories dopo? Questo comando prende come primo input TARGET (ora my_slibrary). Un TARGET si crea con add_executable() o add_library().