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
include Yggdrasil/utils/CMakeFiles/list.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/utils/CMakeFiles/list.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/utils/CMakeFiles/list.dir/flags.make

Yggdrasil/utils/CMakeFiles/list.dir/list.c.o: Yggdrasil/utils/CMakeFiles/list.dir/flags.make
Yggdrasil/utils/CMakeFiles/list.dir/list.c.o: ../Yggdrasil/utils/list.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/utils/CMakeFiles/list.dir/list.c.o"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/list.dir/list.c.o   -c /tmp/tmp.Wyjid08Bsi/Yggdrasil/utils/list.c

Yggdrasil/utils/CMakeFiles/list.dir/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/list.dir/list.c.i"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.Wyjid08Bsi/Yggdrasil/utils/list.c > CMakeFiles/list.dir/list.c.i

Yggdrasil/utils/CMakeFiles/list.dir/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/list.dir/list.c.s"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.Wyjid08Bsi/Yggdrasil/utils/list.c -o CMakeFiles/list.dir/list.c.s

# Object files for target list
list_OBJECTS = \
"CMakeFiles/list.dir/list.c.o"

# External object files for target list
list_EXTERNAL_OBJECTS =

../lib/liblist.a: Yggdrasil/utils/CMakeFiles/list.dir/list.c.o
../lib/liblist.a: Yggdrasil/utils/CMakeFiles/list.dir/build.make
../lib/liblist.a: Yggdrasil/utils/CMakeFiles/list.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../lib/liblist.a"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils && $(CMAKE_COMMAND) -P CMakeFiles/list.dir/cmake_clean_target.cmake
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/list.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/utils/CMakeFiles/list.dir/build: ../lib/liblist.a

.PHONY : Yggdrasil/utils/CMakeFiles/list.dir/build

Yggdrasil/utils/CMakeFiles/list.dir/clean:
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils && $(CMAKE_COMMAND) -P CMakeFiles/list.dir/cmake_clean.cmake
.PHONY : Yggdrasil/utils/CMakeFiles/list.dir/clean

Yggdrasil/utils/CMakeFiles/list.dir/depend:
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.Wyjid08Bsi /tmp/tmp.Wyjid08Bsi/Yggdrasil/utils /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102 /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/utils/CMakeFiles/list.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/utils/CMakeFiles/list.dir/depend

