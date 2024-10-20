target_include_directories(MatrixLib PUBLIC include)

# Add your test executable target
add_executable(matrix_test unit/matrix_creation_test.cpp)

# Link gtest and your library to the test executable
target_link_libraries(matrix_test PUBLIC MatrixLib gtest gtest_main)

enable_testing() # Enable testing
add_test(NAME MyTests COMMAND matrix_test) # Register the test executable
