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
CMAKE_SOURCE_DIR = /tmp/tmp.uw2GsBf4tT

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101

# Include any dependencies generated for this target.
include Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/flags.make

Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/yggdfs_control.c.o: Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/flags.make
Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/yggdfs_control.c.o: ../Yggdrasil/YggDFS/applications/yggdfs_control.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/yggdfs_control.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/YggDFS.dir/yggdfs_control.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil/YggDFS/applications/yggdfs_control.c

Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/yggdfs_control.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/YggDFS.dir/yggdfs_control.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil/YggDFS/applications/yggdfs_control.c > CMakeFiles/YggDFS.dir/yggdfs_control.c.i

Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/yggdfs_control.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/YggDFS.dir/yggdfs_control.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil/YggDFS/applications/yggdfs_control.c -o CMakeFiles/YggDFS.dir/yggdfs_control.c.s

# Object files for target YggDFS
YggDFS_OBJECTS = \
"CMakeFiles/YggDFS.dir/yggdfs_control.c.o"

# External object files for target YggDFS
YggDFS_EXTERNAL_OBJECTS =

bin/YggDFS: Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/yggdfs_control.c.o
bin/YggDFS: Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/build.make
bin/YggDFS: ../lib/libyggdfs_fuse.a
bin/YggDFS: ../lib/liblog.a
bin/YggDFS: /usr/lib/arm-linux-gnueabihf/libfuse.so
bin/YggDFS: ../lib/libyggcore_wireless_new.a
bin/YggDFS: ../lib/librouting.a
bin/YggDFS: ../lib/librouting_interface.a
bin/YggDFS: ../lib/libyggcore_wireless_new.a
bin/YggDFS: ../lib/libygglib_wireless_new.a
bin/YggDFS: ../lib/libygglib_base.a
bin/YggDFS: ../lib/libneighbour_list.a
bin/YggDFS: ../lib/libgen_data_structs.a
bin/YggDFS: Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/YggDFS"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/YggDFS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/build: bin/YggDFS

.PHONY : Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/build

Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/clean:
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications && $(CMAKE_COMMAND) -P CMakeFiles/YggDFS.dir/cmake_clean.cmake
.PHONY : Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/clean

Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/depend:
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.uw2GsBf4tT /tmp/tmp.uw2GsBf4tT/Yggdrasil/YggDFS/applications /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101 /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/YggDFS/applications/CMakeFiles/YggDFS.dir/depend

