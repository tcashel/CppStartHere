cmake_minimum_required(VERSION 3.14)

find_program(CLANG_TIDY_BIN NAMES "clang-tidy" DOC "clang-tidy binary location")
if(CLANG_TIDY_BIN)
    set(CLANG_TIDY_COMMAND "${CLANG_TIDY_BIN}" "-checks=*,-cppcoreguidelines-pro-type-union-access,-hicpp-signed-bitwise,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-google-runtime-int,-hicpp-vararg,-cppcoreguidelines-pro-type-vararg,-cert-err58-cpp,-clang-analyzer-alpha.*,-fuchsia-statically-constructed-objects,-fuchsia-overloaded-operator,-fuchsia-trailing-return,-fuchsia-default-arguments,-readability-else-after-return,-google-readability-namespace-comments,-llvm-namespace-comment,-hicpp-no-array-decay,-cppcoreguidelines-pro-bounds-array-to-pointer-decay,-google-default-arguments,-llvm-header-guard,-google-runtime-references,-misc-macro-parentheses,-bugprone-macro-parentheses,-bugprone-unused-return-value" "-header-filter=.*")
endif()

## Setting Compiler before project declaration
# may be: /usr/lib64/ccache/cc
message("########## User set compiler ##########")
set(CMAKE_C_COMPILER /opt/spotx-devel-llvm/bin/clang)
set(CMAKE_CXX_COMPILER /opt/spotx-devel-llvm/bin/clang++)

message("CMAKE_C_COMPILER " ${CMAKE_C_COMPILER})
message("CMAKE_CXX_COMPILER " ${CMAKE_CXX_COMPILER})

message("CMAKE_CURRENT_SOURCE_DIR " ${CMAKE_CURRENT_SOURCE_DIR})

##### PROJECT #####
project(cpp-sample-project)

# Add all project source files here
set(PROJECT_SOURCE_FILES
    src/main.cpp
    inc/func.h
)

add_executable(${PROJECT_NAME} ${PROJECT_SOURCE_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC inc)

# setting destination of the build files
set_target_properties(${PROJECT_NAME}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/lib"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin"
)

# compiling this project with c++17
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_17)

# clang tidy
if(CLANG_TIDY_BIN)
    set_target_properties(${PROJECT_NAME} PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")
endif()

include(CompilerOptions.cmake)

message("CMAKE_C_COMPILER " ${CMAKE_C_COMPILER})
message("CMAKE_CXX_COMPILER " ${CMAKE_CXX_COMPILER})

include(Tests.cmake)
