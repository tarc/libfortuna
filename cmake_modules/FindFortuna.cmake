find_path (Fortuna_INCLUDE_DIRS NAMES fortuna.h PATH fortuna libfortuna)
find_library (Fortuna_LIBRARIES fortuna)

include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (Fortuna DEFAULT_MSG Fortuna_LIBRARIES Fortuna_INCLUDE_DIRS)
