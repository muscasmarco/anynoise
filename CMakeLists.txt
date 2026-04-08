cmake_minimum_required(VERSION 3.28.3)

set(PROJECT_NAME anynoise)
set(PROJECT_VERSION 0.0.1)

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION})

add_executable(${PROJECT_NAME} src/main.cpp)