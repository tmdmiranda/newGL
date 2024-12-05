cmake_minimum_required(VERSION 3.29)
project(opengl12)
file( COPY ${CMAKE_CURRENT_SOURCE_DIR}/resources DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(assimp CONFIG REQUIRED)
add_subdirectory(glad/)


set(CMAKE_CXX_STANDARD 20)

add_executable(opengl12 main.cpp)

target_link_libraries(opengl12 PRIVATE glfw)
target_link_libraries(opengl12 PRIVATE glm::glm)
<<<<<<< HEAD
target_link_libraries(opengl12 PRIVATE glad)
=======
target_link_libraries(opengl12 PRIVATE glad)
target_link_libraries(opengl12 PRIVATE assimp::assimp)
>>>>>>> 3d097e7a467feaa82fb4df9a021221e4eab04df1
