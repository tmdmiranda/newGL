cmake_minimum_required(VERSION 3.29)
project(opengl12)
file( COPY ${CMAKE_CURRENT_SOURCE_DIR}/resources DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
add_subdirectory(glad/)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)

add_executable(opengl12 main.cpp)

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
