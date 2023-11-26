### Scopo
Buildare lo stesso progetto con metodi e/o in contesti diversi. 

```
- Unix/
  |- gcc/
  |- CMake/

- Windows/
  |- MVSC/
  |- CMake/

- Cross-platform/
  |- CMake/
 
```

### Struttura progetto

```
├── include
│   └── test_cmake
│       └── printer.h
├── src
│    ├── main.cpp
│    └── printer.cpp
│
├── my_dynamic_lib
│   ├── include
│   │   └── my_dynamic_lib
│   │       └── printer.h
│   └── src
│       └── printer.cpp
│
└── my_static_lib
    ├── include
    │   └── my_static_lib
    │       └── printer.h
    └── src
        └── printer.cpp
```


