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
include Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/flags.make

Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/commands.c.o: Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/flags.make
Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/commands.c.o: ../Yggdrasil/remote_control_new/utils/commands.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/commands.c.o"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/commands_new.dir/commands.c.o   -c /tmp/tmp.Wyjid08Bsi/Yggdrasil/remote_control_new/utils/commands.c

Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/commands.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/commands_new.dir/commands.c.i"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.Wyjid08Bsi/Yggdrasil/remote_control_new/utils/commands.c > CMakeFiles/commands_new.dir/commands.c.i

Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/commands.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/commands_new.dir/commands.c.s"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.Wyjid08Bsi/Yggdrasil/remote_control_new/utils/commands.c -o CMakeFiles/commands_new.dir/commands.c.s

# Object files for target commands_new
commands_new_OBJECTS = \
"CMakeFiles/commands_new.dir/commands.c.o"

# External object files for target commands_new
commands_new_EXTERNAL_OBJECTS =

../lib/libcommands_new.a: Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/commands.c.o
../lib/libcommands_new.a: Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/build.make
../lib/libcommands_new.a: Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../../lib/libcommands_new.a"
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils && $(CMAKE_COMMAND) -P CMakeFiles/commands_new.dir/cmake_clean_target.cmake
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/commands_new.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/build: ../lib/libcommands_new.a

.PHONY : Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/build

Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/clean:
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils && $(CMAKE_COMMAND) -P CMakeFiles/commands_new.dir/cmake_clean.cmake
.PHONY : Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/clean

Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/depend:
	cd /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.Wyjid08Bsi /tmp/tmp.Wyjid08Bsi/Yggdrasil/remote_control_new/utils /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102 /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils /tmp/tmp.Wyjid08Bsi/cmake-build-raspi-102/Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/remote_control_new/utils/CMakeFiles/commands_new.dir/depend

