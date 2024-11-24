cmake_minimum_required(VERSION 3.18.1) # FetchContent is available in 3.11+
project(adam LANGUAGES C CXX)

# Generate compile_commands.json
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Our Project
add_executable(${PROJECT_NAME}
  main.cpp
)
