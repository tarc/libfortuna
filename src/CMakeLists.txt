file (GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
include_directories (${CMAKE_CURRENT_SOURCE_DIR})

add_library (${PROJECT_NAME} SHARED ${SOURCES})
add_library (${PROJECT_NAME}-st STATIC ${SOURCES})

if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	target_link_libraries (${PROJECT_NAME} port)
	target_link_libraries (${PROJECT_NAME}-st port)
	include_directories (${CMAKE_CURRENT_SOURCE_DIR}/port)
endif ()

# In windows systems name static library with -st suffix, for the dynamic one
# will produce also a .lib file:
if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	set_target_properties (${PROJECT_NAME}-st PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
endif ()
