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
include remote_control_new/applications/CMakeFiles/cmdreboot.dir/depend.make

# Include the progress variables for this target.
include remote_control_new/applications/CMakeFiles/cmdreboot.dir/progress.make

# Include the compile flags for this target's objects.
include remote_control_new/applications/CMakeFiles/cmdreboot.dir/flags.make

remote_control_new/applications/CMakeFiles/cmdreboot.dir/tools/reboot.c.o: remote_control_new/applications/CMakeFiles/cmdreboot.dir/flags.make
remote_control_new/applications/CMakeFiles/cmdreboot.dir/tools/reboot.c.o: ../remote_control_new/applications/tools/reboot.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object remote_control_new/applications/CMakeFiles/cmdreboot.dir/tools/reboot.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cmdreboot.dir/tools/reboot.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications/tools/reboot.c

remote_control_new/applications/CMakeFiles/cmdreboot.dir/tools/reboot.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cmdreboot.dir/tools/reboot.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications/tools/reboot.c > CMakeFiles/cmdreboot.dir/tools/reboot.c.i

remote_control_new/applications/CMakeFiles/cmdreboot.dir/tools/reboot.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cmdreboot.dir/tools/reboot.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications/tools/reboot.c -o CMakeFiles/cmdreboot.dir/tools/reboot.c.s

# Object files for target cmdreboot
cmdreboot_OBJECTS = \
"CMakeFiles/cmdreboot.dir/tools/reboot.c.o"

# External object files for target cmdreboot
cmdreboot_EXTERNAL_OBJECTS =

remote_control_new/applications/cmdreboot: remote_control_new/applications/CMakeFiles/cmdreboot.dir/tools/reboot.c.o
remote_control_new/applications/cmdreboot: remote_control_new/applications/CMakeFiles/cmdreboot.dir/build.make
remote_control_new/applications/cmdreboot: remote_control_new/utils/libcmdio_new.a
remote_control_new/applications/cmdreboot: remote_control_new/applications/CMakeFiles/cmdreboot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable cmdreboot"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmdreboot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
remote_control_new/applications/CMakeFiles/cmdreboot.dir/build: remote_control_new/applications/cmdreboot

.PHONY : remote_control_new/applications/CMakeFiles/cmdreboot.dir/build

remote_control_new/applications/CMakeFiles/cmdreboot.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications && $(CMAKE_COMMAND) -P CMakeFiles/cmdreboot.dir/cmake_clean.cmake
.PHONY : remote_control_new/applications/CMakeFiles/cmdreboot.dir/clean

remote_control_new/applications/CMakeFiles/cmdreboot.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/remote_control_new/applications/CMakeFiles/cmdreboot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : remote_control_new/applications/CMakeFiles/cmdreboot.dir/depend
