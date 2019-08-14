if(UNIX)
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Werror -Weffc++ -Wpedantic -pedantic-errors)
endif()

if(${CMAKE_CXX_COMPILER_ID} MATCHES "GNU")
    target_compile_options(
        ${PROJECT_NAME} PRIVATE
        -Wno-unknown-pragmas
    )
endif()

if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
    target_compile_options(
        ${PROJECT_NAME} PRIVATE
        -Weverything
        -Wno-c++98-compat
        -Wno-c++98-compat-pedantic
        -Wno-padded
        -Wno-weak-vtables
        -Wno-gnu-anonymous-struct
        -Wno-nested-anon-types
        -Wno-exit-time-destructors
        -Wno-global-constructors
        -Wno-error=deprecated-declarations
        -Wno-disabled-macro-expansion
        -Wno-covered-switch-default
        -fcolor-diagnostics
        -ferror-limit=128
    )
endif()