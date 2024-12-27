mkdir build
cd build

cmake -DCMAKE_TOOLCHAIN_FILE=C:\Users\BigEp\DEVTOOLS\vcpkg\scripts\buildsystems\vcpkg.cmake ..

cmake --build . --config Debug

cd Debug

start ./opengl12.exe
