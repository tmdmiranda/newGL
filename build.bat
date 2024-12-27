mkdir build
cd build

cmake -DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake ..

cmake --build . --config Debug

cd Debug

start ./opengl12.exe