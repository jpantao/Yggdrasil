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
CMAKE_SOURCE_DIR = /tmp/tmp.Wyjid08Bsi

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102

# Include any dependencies generated for this target.
include Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/flags.make

Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/antdfs_control.c.o: Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/flags.make
Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/antdfs_control.c.o: ../Yggdrasil/AntDFS/applications/antdfs_control.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/antdfs_control.c.o"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/AntDFS.dir/antdfs_control.c.o   -c /tmp/tmp.Wyjid08Bsi/Yggdrasil/AntDFS/applications/antdfs_control.c

Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/antdfs_control.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/AntDFS.dir/antdfs_control.c.i"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.Wyjid08Bsi/Yggdrasil/AntDFS/applications/antdfs_control.c > CMakeFiles/AntDFS.dir/antdfs_control.c.i

Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/antdfs_control.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/AntDFS.dir/antdfs_control.c.s"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.Wyjid08Bsi/Yggdrasil/AntDFS/applications/antdfs_control.c -o CMakeFiles/AntDFS.dir/antdfs_control.c.s

# Object files for target AntDFS
AntDFS_OBJECTS = \
"CMakeFiles/AntDFS.dir/antdfs_control.c.o"

# External object files for target AntDFS
AntDFS_EXTERNAL_OBJECTS =

bin/AntDFS: Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/antdfs_control.c.o
bin/AntDFS: Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/build.make
bin/AntDFS: /usr/lib/arm-linux-gnueabihf/libfuse.so
bin/AntDFS: ../lib/libyggcore_wireless_new.a
bin/AntDFS: ../lib/libantdfs_utils.a
bin/AntDFS: ../lib/libdiscovery.a
bin/AntDFS: ../lib/libreliable_dissemination.a
bin/AntDFS: ../lib/librouting.a
bin/AntDFS: ../lib/liblog.a
bin/AntDFS: ../lib/libantdfs_fuse.a
bin/AntDFS: ../lib/libhashtable.a
bin/AntDFS: ../lib/libdiscovery.a
bin/AntDFS: ../lib/libdiscovery_interface.a
bin/AntDFS: ../lib/librouting_interface.a
bin/AntDFS: ../lib/libyggcore_wireless_new.a
bin/AntDFS: ../lib/libygglib_wireless_new.a
bin/AntDFS: ../lib/libygglib_base.a
bin/AntDFS: ../lib/libneighbour_list.a
bin/AntDFS: ../lib/libgen_data_structs.a
bin/AntDFS: ../lib/libantdfs_utils.a
bin/AntDFS: ../lib/liblog.a
bin/AntDFS: ../lib/libhashfunctions.a
bin/AntDFS: Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/AntDFS"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AntDFS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/build: bin/AntDFS

.PHONY : Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/build

Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/clean:
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications && $(CMAKE_COMMAND) -P CMakeFiles/AntDFS.dir/cmake_clean.cmake
.PHONY : Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/clean

Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/depend:
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.Wyjid08Bsi /tmp/tmp.Wyjid08Bsi/Yggdrasil/AntDFS/applications /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102 /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/AntDFS/applications/CMakeFiles/AntDFS.dir/depend

