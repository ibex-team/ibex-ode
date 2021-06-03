cmake_minimum_required (VERSION 3.5.1)

project (IBEX_ODE VERSION 0.42 LANGUAGES CXX)
set (IBEX_ODE_DESCRIPTION "Plugin for dynamical system analysis")
set (IBEX_MIN_VERSION_REQ 2.8.9.1)

# If IBEX_DIR was given on the command-line and not in the environment, set it
# as an environment variable. Enable the usage of 'cmake -DIBEX_DIR=<path> ...'
if (NOT DEFINED ENV{IBEX_DIR} AND DEFINED IBEX_DIR)
  set (ENV{IBEX_DIR} "${IBEX_DIR}")
endif ()
find_package (IBEX ${IBEX_MIN_VERSION_REQ} REQUIRED)
message (STATUS "Found Ibex version ${IBEX_VERSION}")
ibex_init_common () # Ibex should have installed this function

################################################################################
# Compile sources
################################################################################
add_subdirectory (src)

################################################################################
# Tests
################################################################################
# The following command assumes that the tests are in a tests/ subdirectory. So
# the tests/ subdirectory must exist and must contain a CMakeLists.txt file.
# If this is not the case, comment the next line.
#add_make_target_for_ctest (check)

