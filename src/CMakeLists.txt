file (GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
include_directories (${CMAKE_CURRENT_SOURCE_DIR})

add_library (${PROJECT_NAME} ${SOURCES})


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
	include_directories (${CMAKE_SOURCE_DIR}/port)

	add_definitions (-D${PROJECT_NAME}_EXPORTS)
endif ()


if (NOT BUILD_SHARED_LIBS)
	set_target_properties (${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-st)
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
install (TARGETS ${PROJECT_NAME}
	RUNTIME DESTINATION ${RUNTIME_DEST}
	LIBRARY DESTINATION ${LIBRARY_DEST}
	ARCHIVE DESTINATION ${ARCHIVE_DEST})
