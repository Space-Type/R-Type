##
## EPITECH PROJECT, 2026
## Project - R-Type
## File description:
## Root build file:
## builds the server and the client
##

cmake_minimum_required(VERSION 3.20)

project(R-Type VERSION 1.0
               DESCRIPTION "R-Type - networked shoot'em up"
               HOMEPAGE_URL "https://github.com/Space-Type/R-Type"
               LANGUAGES NONE)

if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()


#################################################################
#                                                               #
#                          SUBMODULES                           #
#                                                               #
#################################################################

# Fetch the submodules if the repository was cloned without --recursive
set(RTYPE_SUBMODULE_MARKERS
    GameClient/CMakeLists.txt
    GameClient/lib/raylib/CMakeLists.txt
    GameClient/lib/vcpkg/bootstrap-vcpkg.sh
    GameClient/lib/wrecks/CMakeLists.txt
    Server/CMakeLists.txt
    Server/lib/wrecks/CMakeLists.txt)

foreach(marker IN LISTS RTYPE_SUBMODULE_MARKERS)
    if (NOT EXISTS "${CMAKE_SOURCE_DIR}/${marker}")
        set(RTYPE_MISSING_SUBMODULES TRUE)
    endif()
endforeach()

if (RTYPE_MISSING_SUBMODULES)
    find_package(Git QUIET)
    if (NOT GIT_FOUND OR NOT EXISTS "${CMAKE_SOURCE_DIR}/.git")
        message(FATAL_ERROR "Submodules are missing: run `git submodule update --init --recursive`")
    endif()

    message(STATUS "Fetching git submodules")
    execute_process(COMMAND "${GIT_EXECUTABLE}" submodule update --init --recursive
                    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                    RESULT_VARIABLE RTYPE_SUBMODULE_RESULT)
    if (NOT RTYPE_SUBMODULE_RESULT EQUAL 0)
        message(FATAL_ERROR "`git submodule update --init --recursive` failed")
    endif()
endif()


#################################################################
#                                                               #
#                          COMPONENTS                           #
#                                                               #
#################################################################

include(ExternalProject)

set(RTYPE_COMPONENT_ARGS
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=${CMAKE_SOURCE_DIR})

if (CMAKE_CXX_COMPILER)
    list(APPEND RTYPE_COMPONENT_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER})
endif()

# Each component is a standalone CMake project, with its own Wrecks
# version and toolchain (vcpkg for the client): build them separately.
# The binaries are written at the repository root.
ExternalProject_Add(Server
    SOURCE_DIR "${CMAKE_SOURCE_DIR}/Server"
    BINARY_DIR "${CMAKE_BINARY_DIR}/Server"
    CMAKE_ARGS ${RTYPE_COMPONENT_ARGS}
    BUILD_ALWAYS TRUE
    INSTALL_COMMAND "")

ExternalProject_Add(GameClient
    SOURCE_DIR "${CMAKE_SOURCE_DIR}/GameClient"
    BINARY_DIR "${CMAKE_BINARY_DIR}/GameClient"
    CMAKE_ARGS ${RTYPE_COMPONENT_ARGS}
    BUILD_ALWAYS TRUE
    INSTALL_COMMAND "")

# The client loads its assets relative to the working directory
ExternalProject_Add_Step(GameClient assets
    COMMAND "${CMAKE_COMMAND}" -E copy_directory "${CMAKE_SOURCE_DIR}/GameClient/assets" "${CMAKE_SOURCE_DIR}/assets"
    DEPENDEES build
    ALWAYS TRUE)
