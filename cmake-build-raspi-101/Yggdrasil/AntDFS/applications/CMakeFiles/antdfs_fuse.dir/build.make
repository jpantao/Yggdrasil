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
include Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/flags.make

Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.o: Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/flags.make
Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.o: ../Yggdrasil/AntDFS/applications/antdfs_fuse.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.o"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.o   -c /tmp/tmp.4yRsQEGfYg/Yggdrasil/AntDFS/applications/antdfs_fuse.c

Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.i"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.4yRsQEGfYg/Yggdrasil/AntDFS/applications/antdfs_fuse.c > CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.i

Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.s"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.4yRsQEGfYg/Yggdrasil/AntDFS/applications/antdfs_fuse.c -o CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.s

# Object files for target antdfs_fuse
antdfs_fuse_OBJECTS = \
"CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.o"

# External object files for target antdfs_fuse
antdfs_fuse_EXTERNAL_OBJECTS =

../lib/libantdfs_fuse.a: Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/antdfs_fuse.c.o
../lib/libantdfs_fuse.a: Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/build.make
../lib/libantdfs_fuse.a: Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../../lib/libantdfs_fuse.a"
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications && $(CMAKE_COMMAND) -P CMakeFiles/antdfs_fuse.dir/cmake_clean_target.cmake
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/antdfs_fuse.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/build: ../lib/libantdfs_fuse.a

.PHONY : Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/build

Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/clean:
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications && $(CMAKE_COMMAND) -P CMakeFiles/antdfs_fuse.dir/cmake_clean.cmake
.PHONY : Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/clean

Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/depend:
	cd /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.4yRsQEGfYg /tmp/tmp.4yRsQEGfYg/Yggdrasil/AntDFS/applications /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101 /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications /tmp/tmp.4yRsQEGfYg/cmake-build-raspi-101/Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/AntDFS/applications/CMakeFiles/antdfs_fuse.dir/depend

