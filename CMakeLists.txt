cmake_minimum_required(VERSION 3.28)

# Project variables
set(PROJECT_NAME anynoise)
set(PROJECT_VERSION 0.0.1)

# Qt variables
set(QT_VERSION 6.9.3)

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 ${QT_VERSION} REQUIRED COMPONENTS Core Gui Multimedia Widgets)

add_executable(${PROJECT_NAME} src/main.cpp src/utils/constants.hpp)

target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Qt6::Multimedia
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE   # hides the console window on Windows
    MACOSX_BUNDLE TRUE      # bundles correctly on macOS
)
