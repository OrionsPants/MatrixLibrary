include_directories(include)

add_library(MatrixLib STATIC src/matrix.cpp include/matrix.hpp)

target_include_directories(MatrixLib PUBLIC include)
