cmake_minimum_required (VERSION 3.0.2)

project (IBEX_ODE VERSION 0.42 LANGUAGES CXX)
set (IBEX_ODE_DESCRIPTION "Plugin for dynamical system analysis")

find_package (IBEX 2.8.6 REQUIRED)
message (STATUS "Found Ibex version ${IBEX_VERSION}")
ibex_init_common () # Ibex should have installed this function

# check if Ibex was compiled with an linear programming library
ibex_check_have_lp_lib (HAVE_LP_LIB)
if (NOT HAVE_LP_LIB)
  message (FATAL_ERROR "A Linear Programming library is needed for this plugin")
endif ()

################################################################################
# Compile sources
################################################################################
add_subdirectory (src)

################################################################################
# Tests
################################################################################
add_make_target_for_ctest (check)

