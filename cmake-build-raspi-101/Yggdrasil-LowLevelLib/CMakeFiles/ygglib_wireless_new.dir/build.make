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
include Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.o: ../Yggdrasil-LowLevelLib/src_wireless/api.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/api.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/api.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/api.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.s

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.o: ../Yggdrasil-LowLevelLib/src_wireless/constants.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/constants.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/constants.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/constants.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.s

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.o: ../Yggdrasil-LowLevelLib/src_wireless/data_struct.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/data_struct.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/data_struct.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/data_struct.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.s

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.o: ../Yggdrasil-LowLevelLib/src_wireless/errors.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/errors.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/errors.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/errors.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.s

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.o: ../Yggdrasil-LowLevelLib/src_wireless/hw.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/hw.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/hw.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/hw.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.s

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.o: ../Yggdrasil-LowLevelLib/src_wireless/network.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/network.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/network.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/network.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.s

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.o: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/flags.make
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.o: ../Yggdrasil-LowLevelLib/src_wireless/utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.o"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.o   -c /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/utils.c

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.i"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/utils.c > CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.i

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.s"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib/src_wireless/utils.c -o CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.s

# Object files for target ygglib_wireless_new
ygglib_wireless_new_OBJECTS = \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.o" \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.o" \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.o" \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.o" \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.o" \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.o" \
"CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.o"

# External object files for target ygglib_wireless_new
ygglib_wireless_new_EXTERNAL_OBJECTS =

../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/api.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/constants.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/data_struct.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/errors.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/hw.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/network.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/src_wireless/utils.c.o
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/build.make
../lib/libygglib_wireless_new.a: Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C static library ../../lib/libygglib_wireless_new.a"
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && $(CMAKE_COMMAND) -P CMakeFiles/ygglib_wireless_new.dir/cmake_clean_target.cmake
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ygglib_wireless_new.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/build: ../lib/libygglib_wireless_new.a

.PHONY : Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/build

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/clean:
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib && $(CMAKE_COMMAND) -P CMakeFiles/ygglib_wireless_new.dir/cmake_clean.cmake
.PHONY : Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/clean

Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/depend:
	cd /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.uw2GsBf4tT /tmp/tmp.uw2GsBf4tT/Yggdrasil-LowLevelLib /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101 /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib /tmp/tmp.uw2GsBf4tT/cmake-build-raspi-101/Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil-LowLevelLib/CMakeFiles/ygglib_wireless_new.dir/depend

