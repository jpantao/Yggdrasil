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
include interfaces/CMakeFiles/aggregation_interface.dir/depend.make

# Include the progress variables for this target.
include interfaces/CMakeFiles/aggregation_interface.dir/progress.make

# Include the compile flags for this target's objects.
include interfaces/CMakeFiles/aggregation_interface.dir/flags.make

interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.o: interfaces/CMakeFiles/aggregation_interface.dir/flags.make
interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.o: ../interfaces/aggregation/aggregation_functions.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces/aggregation/aggregation_functions.c

interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces/aggregation/aggregation_functions.c > CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.i

interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces/aggregation/aggregation_functions.c -o CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.s

interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.o: interfaces/CMakeFiles/aggregation_interface.dir/flags.make
interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.o: ../interfaces/aggregation/aggregation_operations.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces/aggregation/aggregation_operations.c

interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces/aggregation/aggregation_operations.c > CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.i

interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces/aggregation/aggregation_operations.c -o CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.s

# Object files for target aggregation_interface
aggregation_interface_OBJECTS = \
"CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.o" \
"CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.o"

# External object files for target aggregation_interface
aggregation_interface_EXTERNAL_OBJECTS =

interfaces/libaggregation_interface.a: interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_functions.c.o
interfaces/libaggregation_interface.a: interfaces/CMakeFiles/aggregation_interface.dir/aggregation/aggregation_operations.c.o
interfaces/libaggregation_interface.a: interfaces/CMakeFiles/aggregation_interface.dir/build.make
interfaces/libaggregation_interface.a: interfaces/CMakeFiles/aggregation_interface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C static library libaggregation_interface.a"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && $(CMAKE_COMMAND) -P CMakeFiles/aggregation_interface.dir/cmake_clean_target.cmake
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aggregation_interface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
interfaces/CMakeFiles/aggregation_interface.dir/build: interfaces/libaggregation_interface.a

.PHONY : interfaces/CMakeFiles/aggregation_interface.dir/build

interfaces/CMakeFiles/aggregation_interface.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces && $(CMAKE_COMMAND) -P CMakeFiles/aggregation_interface.dir/cmake_clean.cmake
.PHONY : interfaces/CMakeFiles/aggregation_interface.dir/clean

interfaces/CMakeFiles/aggregation_interface.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/interfaces /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/interfaces/CMakeFiles/aggregation_interface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : interfaces/CMakeFiles/aggregation_interface.dir/depend
