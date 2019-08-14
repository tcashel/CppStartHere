###### TESTS ####
set(TEST_SOURCE_FILES tests/test_file.cpp)
enable_testing()
project(cpp-sample-project-test)
add_executable(${PROJECT_NAME} ${TEST_SOURCE_FILES})

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_17)

# setting destination of the build files
set_target_properties(${PROJECT_NAME}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin"
)

include(CompilerOptions.cmake)

## Including directories for the Catch2 git submodule (header only lib)
# using the SYSTEM flag precents the Catch2 headers from being compiled with my projects flags.
target_include_directories(${PROJECT_NAME} SYSTEM PRIVATE Catch2/single_include/catch2/)

add_test(CppSampleTests ${EXECUTABLE_OUTPUT_PATH}${PROJECT_NAME})