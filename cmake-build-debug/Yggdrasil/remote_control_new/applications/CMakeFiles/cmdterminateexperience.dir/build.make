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
include Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/flags.make

Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.o: Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/flags.make
Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.o: ../Yggdrasil/remote_control_new/applications/tools/terminateexperience.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications/tools/terminateexperience.c

Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications/tools/terminateexperience.c > CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.i

Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications/tools/terminateexperience.c -o CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.s

# Object files for target cmdterminateexperience
cmdterminateexperience_OBJECTS = \
"CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.o"

# External object files for target cmdterminateexperience
cmdterminateexperience_EXTERNAL_OBJECTS =

../bin/cmdterminateexperience: Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/tools/terminateexperience.c.o
../bin/cmdterminateexperience: Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/build.make
../bin/cmdterminateexperience: ../lib/libcmdio_new.a
../bin/cmdterminateexperience: Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../../bin/cmdterminateexperience"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmdterminateexperience.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/build: ../bin/cmdterminateexperience

.PHONY : Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/build

Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications && $(CMAKE_COMMAND) -P CMakeFiles/cmdterminateexperience.dir/cmake_clean.cmake
.PHONY : Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/clean

Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/remote_control_new/applications /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/remote_control_new/applications/CMakeFiles/cmdterminateexperience.dir/depend
