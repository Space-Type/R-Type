##
## EPITECH PROJECT, 2026
## Project - RType
## File description:
## vcpkg overlay port: SDL_GameControllerDB
##

# A data file only (gamecontrollerdb.txt), pinned to a commit
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mdqinc/SDL_GameControllerDB
    REF 07af1d50187e94c861c9f9f5d8a55b148f11306b
    SHA512 7469cc149000436eca18a1e8f9e54ba632ff1d8c8172df8a75c0bed10b5c0a7762b454d016f3d23ddafd96cbb0bd2f87da6e7e79a90d208312cee4dff923100d
    HEAD_REF master
)

file(INSTALL "${SOURCE_PATH}/gamecontrollerdb.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
