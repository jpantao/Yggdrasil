# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /home/jpantao/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/201.7846.88/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/jpantao/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/201.7846.88/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jpantao/Git/BScResearch/Yggdrasil

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug

# Include any dependencies generated for this target.
include Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/flags.make

Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.o: Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/flags.make
Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.o: ../Yggdrasil/remote_control/applications/ControlStructure.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control/applications/ControlStructure.c

Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control/applications/ControlStructure.c > CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.i

Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control/applications/ControlStructure.c -o CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.s

# Object files for target YggdrasilControlProcess_old
YggdrasilControlProcess_old_OBJECTS = \
"CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.o"

# External object files for target YggdrasilControlProcess_old
YggdrasilControlProcess_old_EXTERNAL_OBJECTS =

../bin/YggdrasilControlProcess_old: Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/ControlStructure.c.o
../bin/YggdrasilControlProcess_old: Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/build.make
../bin/YggdrasilControlProcess_old: ../lib/libcontrol_tree.a
../bin/YggdrasilControlProcess_old: ../lib/libcontrol_server.a
../bin/YggdrasilControlProcess_old: ../lib/libcontrol_discovery.a
../bin/YggdrasilControlProcess_old: ../lib/libcommands.a
../bin/YggdrasilControlProcess_old: ../lib/libtopology_manager.a
../bin/YggdrasilControlProcess_old: ../lib/libaggregation_interface.a
../bin/YggdrasilControlProcess_old: ../lib/libyggcore_wireless_new.a
../bin/YggdrasilControlProcess_old: ../lib/libygglib_wireless_new.a
../bin/YggdrasilControlProcess_old: ../lib/libyggcore_wireless.a
../bin/YggdrasilControlProcess_old: ../lib/libygglib_wireless.a
../bin/YggdrasilControlProcess_old: ../lib/libygglib_base.a
../bin/YggdrasilControlProcess_old: ../lib/libgen_data_structs.a
../bin/YggdrasilControlProcess_old: Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../../bin/YggdrasilControlProcess_old"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/YggdrasilControlProcess_old.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/build: ../bin/YggdrasilControlProcess_old

.PHONY : Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/build

Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications && $(CMAKE_COMMAND) -P CMakeFiles/YggdrasilControlProcess_old.dir/cmake_clean.cmake
.PHONY : Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/clean

Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control/applications /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/remote_control/applications/CMakeFiles/YggdrasilControlProcess_old.dir/depend

