##
## EPITECH PROJECT, 2026
## Project - R-Type
## File description:
## CMake build file for
## the R-Type project.
##

cmake_minimum_required(VERSION 3.20)

project(R-Type VERSION 1.0
               DESCRIPTION "R-Type - networked shoot'em up"
               HOMEPAGE_URL "https://github.com/Space-Type/R-Type"
               LANGUAGES NONE)


           cmake_minimum_required(VERSION 3.15)


# ----------- Project Dependencies ----------- #

add_subdirectory(lib/wrecks)
add_subdirectory(lib/protecs)


# --------------- Project Build -------------- #

add_subdirectory(src/client)
add_subdirectory(src/server)


# -------------- Project Config -------------- #

# TODO: copy client's assets/ directory to the appropriate location

set_target_properties(r-type_client PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set_target_properties(r-type_server PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
