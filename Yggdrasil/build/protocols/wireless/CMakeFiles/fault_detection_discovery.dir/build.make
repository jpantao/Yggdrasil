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
include protocols/wireless/CMakeFiles/fault_detection_discovery.dir/depend.make

# Include the progress variables for this target.
include protocols/wireless/CMakeFiles/fault_detection_discovery.dir/progress.make

# Include the compile flags for this target's objects.
include protocols/wireless/CMakeFiles/fault_detection_discovery.dir/flags.make

protocols/wireless/CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.o: protocols/wireless/CMakeFiles/fault_detection_discovery.dir/flags.make
protocols/wireless/CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.o: ../protocols/wireless/discovery/fault_detector_discovery.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object protocols/wireless/CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless/discovery/fault_detector_discovery.c

protocols/wireless/CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless/discovery/fault_detector_discovery.c > CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.i

protocols/wireless/CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless/discovery/fault_detector_discovery.c -o CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.s

# Object files for target fault_detection_discovery
fault_detection_discovery_OBJECTS = \
"CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.o"

# External object files for target fault_detection_discovery
fault_detection_discovery_EXTERNAL_OBJECTS =

protocols/wireless/libfault_detection_discovery.a: protocols/wireless/CMakeFiles/fault_detection_discovery.dir/discovery/fault_detector_discovery.c.o
protocols/wireless/libfault_detection_discovery.a: protocols/wireless/CMakeFiles/fault_detection_discovery.dir/build.make
protocols/wireless/libfault_detection_discovery.a: protocols/wireless/CMakeFiles/fault_detection_discovery.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libfault_detection_discovery.a"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && $(CMAKE_COMMAND) -P CMakeFiles/fault_detection_discovery.dir/cmake_clean_target.cmake
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fault_detection_discovery.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
protocols/wireless/CMakeFiles/fault_detection_discovery.dir/build: protocols/wireless/libfault_detection_discovery.a

.PHONY : protocols/wireless/CMakeFiles/fault_detection_discovery.dir/build

protocols/wireless/CMakeFiles/fault_detection_discovery.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && $(CMAKE_COMMAND) -P CMakeFiles/fault_detection_discovery.dir/cmake_clean.cmake
.PHONY : protocols/wireless/CMakeFiles/fault_detection_discovery.dir/clean

protocols/wireless/CMakeFiles/fault_detection_discovery.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless/CMakeFiles/fault_detection_discovery.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : protocols/wireless/CMakeFiles/fault_detection_discovery.dir/depend
