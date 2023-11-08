cmake_minimum_required(VERSION 3.13)

project(my_static_lib)

# Creiamo libmy_slibrary.a
add_library(my_slibrary STATIC src/printer.cpp) # (gcc -c printer.cpp; ar rs libmy_slibrary printer.o)
# Dove la crea? Ecco cosa succede:
# In cmake-test/ facciamo "> cmake -S . -B build/": cmake-test/CMakeLists.txt viene processato e i file di output messi in cmake-test/build.
# In cmake-test/CMakeLists.txt c'è comando "add_subdirectory(my_static_lib)" che reindirizza qui: questo CMakeLists.txt viene quindi letto e processato.  
# I files di output abbiamo detto essere in cmake-test/build. Facendo lì "> make", lì è dove verranno messi tutti i files di build.
# Quindi dove sarà libmy_slibrary.a? In cmake-test/build!

target_include_directories(my_slibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include) # Posizione printer.h (gcc -I)
# Perché metto target_include_directories dopo? Questo comando prende come primo input TARGET (ora my_slibrary). Un TARGET si crea con add_executable() o add_library().
