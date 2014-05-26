cmake_minimum_required (VERSION 2.8.5)

project(fortuna)


option (BUILD_SHARED_LIBS
	"Compile Libfortuna as a shared library" ON)

set (libfortuna_VERSION_MAJOR 0)
set (libfortuna_VERSION_MINOR 1)

# header file to pass some CMake settings to source code:
configure_file (
	"${PROJECT_SOURCE_DIR}/libfortunaConfig.h.in"
	"${PROJECT_BINARY_DIR}/libfortunaConfig.h"
	)

# to find fortunaConfig.h:
include_directories ("${PROJECT_BINARY_DIR}")


set(_CFLAGS "-O2")


# Compiler specific settings:
if (("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang") OR
	("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU"))

	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${_CFLAGS} -fPIC -g -Wall -Werror -Wno-strict-aliasing")

elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")

elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")

	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /D _CRT_SECURE_NO_WARNINGS")
endif ()


# Include postgres port of *nixe's functions to Windows
if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	add_subdirectory (port)
endif ()

add_subdirectory (src)
