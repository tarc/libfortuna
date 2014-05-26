file (GLOB SOURCES *.c)

include_directories (${CMAKE_SOURCE_DIR}/src)

add_library (port STATIC ${SOURCES})
