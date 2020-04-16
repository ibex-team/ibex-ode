################################################################################
# First example: compiling a library that depends on libibex
################################################################################
# source files of libibex-ode
list (APPEND SRC ${CMAKE_CURRENT_SOURCE_DIR}/ibex_AttractionRegion.cpp
                 ${CMAKE_CURRENT_SOURCE_DIR}/ibex_AttractionRegion.h
                 ${CMAKE_CURRENT_SOURCE_DIR}/ibex_P_StructLyapunov.cpp
                 ${CMAKE_CURRENT_SOURCE_DIR}/ibex_P_StructLyapunov.h

                 # Add more source files here.
                 # For most plugins, the rest can be left as is.
                 )

# Create the target for libibex-ode
add_library (ibex-ode ${SRC})
# TODO BUILD_INTERFACE and INSTALL_INTERFACE for inc dirs
target_include_directories (ibex-ode PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries (ibex-ode PUBLIC Ibex::ibex)

# installation of libibex-ode files
list_filter_header (HDR ${SRC}) # Ibex should have installed this function
install (TARGETS ibex-ode DESTINATION ${CMAKE_INSTALL_LIBDIR})
install (FILES ${HDR} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/ibex-ode)

################################################################################
# Executables in the bin subdirectory
################################################################################
add_subdirectory (bin)
