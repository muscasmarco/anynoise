cmake_minimum_required(VERSION 3.28)

# Project variables
set(PROJECT_NAME anynoise)
set(PROJECT_VERSION 0.0.1)

# Qt variables
set(QT_VERSION 6.9.3)
set(CMAKE_AUTOMOC True)

# CXX variables
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)

find_package(Qt6 ${QT_VERSION} REQUIRED COMPONENTS Core Gui Multimedia Quick)

add_executable(${PROJECT_NAME} src/main.cpp src/utils/constants.hpp src/main.cpp)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

add_subdirectory(ui/MainWindow) # Import to the external module for MainWindow - the mainWindow QML build

target_link_libraries(${PROJECT_NAME} PRIVATE
		Qt6::Quick
		Qt6::Core
    	Qt6::Gui
    	Qt6::Multimedia
		MainWindowlib
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE   # hides the console window on Windows
    MACOSX_BUNDLE TRUE      # bundles correctly on macOS
)
