cmake_minimum_required(VERSION 3.14)
project(BridgeProblem)

set(CMAKE_CXX_STANDARD 17)

set(PROJECT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(EXECUTABLE_OUTPUT_PATH ./bin/)

include_directories(CATCH Catch2/single_include/catch2/)
set(PROJECT_SOURCE_FILES
    main.cpp
    func.h
)
project(bridge-problem)
add_executable(${PROJECT_NAME} ${PROJECT_SOURCE_FILES})

###### TESTS ####

set(TEST_SOURCE_FILES test_file.cpp)
enable_testing()
project(bridge-problem-test)
add_executable(${PROJECT_NAME} ${TEST_SOURCE_FILES})
add_test(BridgeTest ${EXECUTABLE_OUTPUT_PATH}${PROJECT_NAME})