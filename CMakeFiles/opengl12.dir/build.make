# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tmdmiranda/git/newGL

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tmdmiranda/git/newGL

# Include any dependencies generated for this target.
include CMakeFiles/opengl12.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/opengl12.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/opengl12.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/opengl12.dir/flags.make

CMakeFiles/opengl12.dir/codegen:
.PHONY : CMakeFiles/opengl12.dir/codegen

CMakeFiles/opengl12.dir/main.cpp.o: CMakeFiles/opengl12.dir/flags.make
CMakeFiles/opengl12.dir/main.cpp.o: main.cpp
CMakeFiles/opengl12.dir/main.cpp.o: CMakeFiles/opengl12.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/tmdmiranda/git/newGL/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/opengl12.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl12.dir/main.cpp.o -MF CMakeFiles/opengl12.dir/main.cpp.o.d -o CMakeFiles/opengl12.dir/main.cpp.o -c /home/tmdmiranda/git/newGL/main.cpp

CMakeFiles/opengl12.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl12.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/tmdmiranda/git/newGL/main.cpp > CMakeFiles/opengl12.dir/main.cpp.i

CMakeFiles/opengl12.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl12.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/tmdmiranda/git/newGL/main.cpp -o CMakeFiles/opengl12.dir/main.cpp.s

# Object files for target opengl12
opengl12_OBJECTS = \
"CMakeFiles/opengl12.dir/main.cpp.o"

# External object files for target opengl12
opengl12_EXTERNAL_OBJECTS =

opengl12: CMakeFiles/opengl12.dir/main.cpp.o
opengl12: CMakeFiles/opengl12.dir/build.make
opengl12: CMakeFiles/opengl12.dir/compiler_depend.ts
opengl12: /usr/lib/libglfw.so.3.4
opengl12: /usr/lib/libglm.a
opengl12: glad/libglad.a
opengl12: CMakeFiles/opengl12.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/tmdmiranda/git/newGL/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable opengl12"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opengl12.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/opengl12.dir/build: opengl12
.PHONY : CMakeFiles/opengl12.dir/build

CMakeFiles/opengl12.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/opengl12.dir/cmake_clean.cmake
.PHONY : CMakeFiles/opengl12.dir/clean

CMakeFiles/opengl12.dir/depend:
	cd /home/tmdmiranda/git/newGL && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tmdmiranda/git/newGL /home/tmdmiranda/git/newGL /home/tmdmiranda/git/newGL /home/tmdmiranda/git/newGL /home/tmdmiranda/git/newGL/CMakeFiles/opengl12.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/opengl12.dir/depend

