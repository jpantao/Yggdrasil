# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/tmp.4yRsQEGfYg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101

# Include any dependencies generated for this target.
include Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/flags.make

Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/yggdfs_utils.c.o: Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/flags.make
Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/yggdfs_utils.c.o: ../Yggdrasil/YggDFS/utils/yggdfs_utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/yggdfs_utils.c.o"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/utils.dir/yggdfs_utils.c.o   -c /tmp/tmp.4yRsQEGfYg/Yggdrasil/YggDFS/utils/yggdfs_utils.c

Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/yggdfs_utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/utils.dir/yggdfs_utils.c.i"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.4yRsQEGfYg/Yggdrasil/YggDFS/utils/yggdfs_utils.c > CMakeFiles/utils.dir/yggdfs_utils.c.i

Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/yggdfs_utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/utils.dir/yggdfs_utils.c.s"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.4yRsQEGfYg/Yggdrasil/YggDFS/utils/yggdfs_utils.c -o CMakeFiles/utils.dir/yggdfs_utils.c.s

# Object files for target utils
utils_OBJECTS = \
"CMakeFiles/utils.dir/yggdfs_utils.c.o"

# External object files for target utils
utils_EXTERNAL_OBJECTS =

../lib/libutils.a: Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/yggdfs_utils.c.o
../lib/libutils.a: Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/build.make
../lib/libutils.a: Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../../lib/libutils.a"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils && $(CMAKE_COMMAND) -P CMakeFiles/utils.dir/cmake_clean_target.cmake
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/build: ../lib/libutils.a

.PHONY : Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/build

Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/clean:
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils && $(CMAKE_COMMAND) -P CMakeFiles/utils.dir/cmake_clean.cmake
.PHONY : Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/clean

Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/depend:
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.4yRsQEGfYg /tmp/tmp.4yRsQEGfYg/Yggdrasil/YggDFS/utils /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101 /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/YggDFS/utils/CMakeFiles/utils.dir/depend
