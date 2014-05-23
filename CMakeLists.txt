cmake_minimum_required(VERSION 2.8)

set(_CFLAGS "-O2")

project(fortuna)


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
