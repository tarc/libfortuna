cmake_minimum_required(VERSION 2.8)

set(_CFLAGS "-O2")

project(fortuna)


# Compiler specific settings:
if (("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang") OR
	("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU"))

	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${_CFLAGS} -fPIC -g -Wall -Werror -Wno-strict-aliasing")

elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")

elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")

	#set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} /D WIN32 /D _WINDOWS /D _USRDLL /D _CRT_SECURE_NO_WARNINGS /D S3DX_DLL /D OS_MSWIN32 /D _MBCS /D _WIN32_WINNT=0x0500")
endif ()


add_subdirectory (src)
