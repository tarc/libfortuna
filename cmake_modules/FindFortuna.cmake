if (libfortuna_USE_STATIC_LIBS)
	find_library (Fortuna_LIBRARIES fortuna-st)
else ()
	find_library (Fortuna_LIBRARIES fortuna)
endif ()

find_path (Fortuna_INCLUDE_DIRS
	NAMES fortuna.h
	PATHS /usr/include /usr/local/include ENV PROGRAMFILES
	PATH_SUFFIXES fortuna libfortuna)

include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (Fortuna DEFAULT_MSG Fortuna_LIBRARIES Fortuna_INCLUDE_DIRS)
