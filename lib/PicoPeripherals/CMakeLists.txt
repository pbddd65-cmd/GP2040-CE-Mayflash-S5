add_library(PicoPeripherals 
    peripheral_i2c.cpp
    peripheral_spi.cpp
    peripheral_usb.cpp
)

target_include_directories(PicoPeripherals PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}
    ${PICO_PIO_USB_PATH}/src
)

target_link_libraries(PicoPeripherals PUBLIC
    pico_stdlib
    pico_pio_usb
    hardware_dma
    hardware_gpio
    hardware_i2c
    hardware_spi
    hardware_sync
)
