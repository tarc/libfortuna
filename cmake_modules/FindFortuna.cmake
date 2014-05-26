set (CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} $ENV{PROGRAMFILES}/fortuna)

if (libfortuna_USE_STATIC_LIBS)
	find_library (Fortuna_LIBRARIES fortuna)
endif ()

find_path (Fortuna_INCLUDE_DIRS fortuna.h)

include (FindPackageHandleStandardArgs)
if (libfortuna_USE_STATIC_LIBS)
	find_package_handle_standard_args (Fortuna DEFAULT_MSG Fortuna_LIBRARIES Fortuna_INCLUDE_DIRS)
else ()
	find_package_handle_standard_args (Fortuna DEFAULT_MSG Fortuna_INCLUDE_DIRS)
endif ()
