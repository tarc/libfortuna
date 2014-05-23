file (GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
include_directories (${CMAKE_CURRENT_SOURCE_DIR})

add_library (${PROJECT_NAME} SHARED ${SOURCES})
add_library (${PROJECT_NAME}-st STATIC ${SOURCES})


# Declare macros to export dlls functions:
include (GenerateExportHeader)

GENERATE_EXPORT_HEADER( ${PROJECT_NAME}
	BASE_NAME ${PROJECT_NAME}
	#EXPORT_MACRO_NAME MyLibrary_EXPORT
	#EXPORT_FILE_NAME MyLibrary_Export.h
	)
include_directories (${CMAKE_CURRENT_BINARY_DIR})


# Include portability headers for Windows and link the corresponding libs.
# Also make the library export functions tagged with FORTUNA_EXPORT, and not
# import them:
if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	target_link_libraries (${PROJECT_NAME} port)
	target_link_libraries (${PROJECT_NAME}-st port)
	include_directories (${CMAKE_SOURCE_DIR}/port)

	add_definitions (-D${PROJECT_NAME}_EXPORTS)
endif ()


# In windows systems, static library's name is appended with -st suffix, for
# the dynamic one will produce also a .lib file:
if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	set_target_properties (${PROJECT_NAME}-st PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
endif ()


# Installation
if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	set(FILES_DEST "include")
	set(RUNTIME_DEST "lib") # DLL shared libraries
	set(LIBRARY_DEST "lib") # modules?
	set(ARCHIVE_DEST "lib") # static libs and import part of DLLs (LIB files)
else ()
	set(FILES_DEST "include/libfortuna")
	set(RUNTIME_DEST "bin") # executable targets
	set(LIBRARY_DEST "lib") # non DLL shared libraries
	set(ARCHIVE_DEST "lib") # static libs
endif ()

file (GLOB HEADER_FILES ${CMAKE_SOURCE_DIR}/src/*.h ${CMAKE_CURRENT_BINARY_DIR}/*.h)

install (FILES ${HEADER_FILES} DESTINATION ${FILES_DEST})
install (TARGETS ${PROJECT_NAME} ${PROJECT_NAME}-st
	RUNTIME DESTINATION ${RUNTIME_DEST}
	LIBRARY DESTINATION ${LIBRARY_DEST}
	ARCHIVE DESTINATION ${ARCHIVE_DEST})
