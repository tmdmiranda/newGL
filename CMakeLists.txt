cmake_minimum_required(VERSION 3.29)
project(opengl12)

# Find required packages
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

# Add glad subdirectory
add_subdirectory(glad/)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)

# Add executable
add_executable(opengl12 main.cpp)

# Link libraries
target_link_libraries(opengl12 PRIVATE glfw)
target_link_libraries(opengl12 PRIVATE glm::glm)
target_link_libraries(opengl12 PRIVATE glad)

# Copy resources folder to the output folder (Debug or Release)
add_custom_command(
    TARGET opengl12 POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_CURRENT_SOURCE_DIR}/resources
        $<TARGET_FILE_DIR:opengl12>/resources
)

# Ensure that resources are copied as a part of the build process
add_custom_target(copy_resources ALL
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_CURRENT_SOURCE_DIR}/resources
        ${CMAKE_CURRENT_BINARY_DIR}/resources
    DEPENDS opengl12
)