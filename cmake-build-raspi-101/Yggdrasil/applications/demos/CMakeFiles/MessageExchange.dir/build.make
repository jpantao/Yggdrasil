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
include Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/flags.make

Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/MessageExchange.c.o: Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/flags.make
Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/MessageExchange.c.o: ../Yggdrasil/applications/demos/MessageExchange.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/MessageExchange.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MessageExchange.dir/MessageExchange.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil/applications/demos/MessageExchange.c

Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/MessageExchange.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MessageExchange.dir/MessageExchange.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil/applications/demos/MessageExchange.c > CMakeFiles/MessageExchange.dir/MessageExchange.c.i

Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/MessageExchange.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MessageExchange.dir/MessageExchange.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil/applications/demos/MessageExchange.c -o CMakeFiles/MessageExchange.dir/MessageExchange.c.s

# Object files for target MessageExchange
MessageExchange_OBJECTS = \
"CMakeFiles/MessageExchange.dir/MessageExchange.c.o"

# External object files for target MessageExchange
MessageExchange_EXTERNAL_OBJECTS =

../bin/MessageExchange: Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/MessageExchange.c.o
../bin/MessageExchange: Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/build.make
../bin/MessageExchange: ../lib/libyggcore_wireless.a
../bin/MessageExchange: ../lib/libygglib_wireless.a
../bin/MessageExchange: ../lib/libygglib_base.a
../bin/MessageExchange: ../lib/libgen_data_structs.a
../bin/MessageExchange: Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../../bin/MessageExchange"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MessageExchange.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/build: ../bin/MessageExchange

.PHONY : Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/build

Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/clean:
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos && $(CMAKE_COMMAND) -P CMakeFiles/MessageExchange.dir/cmake_clean.cmake
.PHONY : Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/clean

Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/depend:
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.uw2GsBf4tT /tmp/tmp.uw2GsBf4tT/Yggdrasil/applications/demos /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101 /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/applications/demos/CMakeFiles/MessageExchange.dir/depend

