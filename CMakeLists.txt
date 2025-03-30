cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(flash_nuke C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(flash_nuke
        nuke.c
        )

target_link_libraries(flash_nuke
        pico_stdlib
        hardware_flash
        )

# It doesn't make sense to run this program from flash. Always build a
# RAM-only binary.
pico_set_binary_type(flash_nuke no_flash)

if(PICO_RP2350)
    pico_set_uf2_family(${CMAKE_PROJECT_NAME} "rp2350-arm-s")

    if (SECURE_BOOT_PKEY)
        message(STATUS "Secure Boot Key ${SECURE_BOOT_PKEY}")
        pico_sign_binary(${CMAKE_PROJECT_NAME} ${SECURE_BOOT_PKEY})
        pico_hash_binary(${CMAKE_PROJECT_NAME})
    endif()
endif()

pico_add_extra_outputs(flash_nuke)


