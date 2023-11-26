### Struttura progetto
```
├── CMakeLists.txt
├── README.md
│
├── include
│   └── test_cmake
│       └── printer.h
├── src
│    ├── main.cpp
│    └── printer.cpp
│
├── my_dynamic_lib
│   ├── CMakeLists.txt
│   ├── include
│   │   └── my_dynamic_lib
│   │       └── printer.h
│   └── src
│       └── printer.cpp
│
└── my_static_lib
    ├── CMakeLists.txt
    ├── include
    │   └── my_static_lib
    │       └── printer.h
    └── src
        └── printer.cpp
```

### Build & Run  

```bash
> cd cmake-test/
> cmake -S . -B build/
> cd build/
> ./cmake-test