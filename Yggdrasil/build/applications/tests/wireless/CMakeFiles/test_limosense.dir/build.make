# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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


# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build

# Include any dependencies generated for this target.
include applications/tests/wireless/CMakeFiles/test_limosense.dir/depend.make

# Include the progress variables for this target.
include applications/tests/wireless/CMakeFiles/test_limosense.dir/progress.make

# Include the compile flags for this target's objects.
include applications/tests/wireless/CMakeFiles/test_limosense.dir/flags.make

applications/tests/wireless/CMakeFiles/test_limosense.dir/limosense_test.c.o: applications/tests/wireless/CMakeFiles/test_limosense.dir/flags.make
applications/tests/wireless/CMakeFiles/test_limosense.dir/limosense_test.c.o: ../applications/tests/wireless/limosense_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object applications/tests/wireless/CMakeFiles/test_limosense.dir/limosense_test.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_limosense.dir/limosense_test.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/applications/tests/wireless/limosense_test.c

applications/tests/wireless/CMakeFiles/test_limosense.dir/limosense_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_limosense.dir/limosense_test.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/applications/tests/wireless/limosense_test.c > CMakeFiles/test_limosense.dir/limosense_test.c.i

applications/tests/wireless/CMakeFiles/test_limosense.dir/limosense_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_limosense.dir/limosense_test.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/applications/tests/wireless/limosense_test.c -o CMakeFiles/test_limosense.dir/limosense_test.c.s

# Object files for target test_limosense
test_limosense_OBJECTS = \
"CMakeFiles/test_limosense.dir/limosense_test.c.o"

# External object files for target test_limosense
test_limosense_EXTERNAL_OBJECTS =

applications/tests/wireless/test_limosense: applications/tests/wireless/CMakeFiles/test_limosense.dir/limosense_test.c.o
applications/tests/wireless/test_limosense: applications/tests/wireless/CMakeFiles/test_limosense.dir/build.make
applications/tests/wireless/test_limosense: core/libyggcore_wireless.a
applications/tests/wireless/test_limosense: protocols/wireless/liblimosense.a
applications/tests/wireless/test_limosense: protocols/wireless/libfault_detection_discovery.a
applications/tests/wireless/test_limosense: interfaces/libaggregation_interface.a
applications/tests/wireless/test_limosense: core/libneighbour_list.a
applications/tests/wireless/test_limosense: interfaces/libdiscovery_interface.a
applications/tests/wireless/test_limosense: core/libyggcore_wireless_new.a
applications/tests/wireless/test_limosense: core/libgen_data_structs.a
applications/tests/wireless/test_limosense: applications/tests/wireless/CMakeFiles/test_limosense.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable test_limosense"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_limosense.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
applications/tests/wireless/CMakeFiles/test_limosense.dir/build: applications/tests/wireless/test_limosense

.PHONY : applications/tests/wireless/CMakeFiles/test_limosense.dir/build

applications/tests/wireless/CMakeFiles/test_limosense.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless && $(CMAKE_COMMAND) -P CMakeFiles/test_limosense.dir/cmake_clean.cmake
.PHONY : applications/tests/wireless/CMakeFiles/test_limosense.dir/clean

applications/tests/wireless/CMakeFiles/test_limosense.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/applications/tests/wireless /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/applications/tests/wireless/CMakeFiles/test_limosense.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : applications/tests/wireless/CMakeFiles/test_limosense.dir/depend

