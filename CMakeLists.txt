##
## EPITECH PROJECT, 2026
## Project - R-Type
## File description:
## CMake build file for
## the R-Type project.
##

cmake_minimum_required(VERSION 3.20)

# VCPKG support
if (DEFINED ENV{VCPKG_ROOT})
    message("setting up vcpkg")

    file(TO_CMAKE_PATH "$ENV{VCPKG_ROOT}" RTYPE_VCPKG_ROOT)
    set(CMAKE_TOOLCHAIN_FILE "${RTYPE_VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
        CACHE STRING "vcpkg toolchain file")

    # Static libraries on Windows: no raylib DLL to ship next to the client
    if (WIN32 AND NOT DEFINED VCPKG_TARGET_TRIPLET)
        set(VCPKG_TARGET_TRIPLET "x64-windows-static-md" CACHE STRING "vcpkg triplet")
    endif()
endif()


# --------------- Project Setup -------------- #

project(R-Type VERSION 1.0
               DESCRIPTION "R-Type - networked shoot'em up"
               HOMEPAGE_URL "https://github.com/Space-Type/R-Type"
               LANGUAGES NONE)

# ----------- Project Dependencies ----------- #

add_subdirectory(lib/wrecks)
add_subdirectory(lib/protecs)


# --------------- Project Build -------------- #

add_subdirectory(src/client)
add_subdirectory(src/server)


# -------------- Project Config -------------- #

# TODO: copy client's assets/ directory to the appropriate location

set_target_properties(r-type_client PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})

set_target_properties(r-type_server PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})

add_custom_target(copy_assets ALL
    COMMAND "${CMAKE_COMMAND}" -E copy_directory
        "${CMAKE_CURRENT_SOURCE_DIR}/src/client/assets"
        "${CMAKE_SOURCE_DIR}/assets"
    COMMENT "copying client assets")

add_custom_target(copy_stages ALL
    COMMAND "${CMAKE_COMMAND}" -E copy_directory
        "${CMAKE_CURRENT_SOURCE_DIR}/src/server/stages"
        "${CMAKE_SOURCE_DIR}/stages"
    COMMENT "copying server stages")
