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
include Yggdrasil/utils/CMakeFiles/Json.dir/depend.make

# Include the progress variables for this target.
include Yggdrasil/utils/CMakeFiles/Json.dir/progress.make

# Include the compile flags for this target's objects.
include Yggdrasil/utils/CMakeFiles/Json.dir/flags.make

Yggdrasil/utils/CMakeFiles/Json.dir/cJSON.c.o: Yggdrasil/utils/CMakeFiles/Json.dir/flags.make
Yggdrasil/utils/CMakeFiles/Json.dir/cJSON.c.o: ../Yggdrasil/utils/cJSON.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Yggdrasil/utils/CMakeFiles/Json.dir/cJSON.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Json.dir/cJSON.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/utils/cJSON.c

Yggdrasil/utils/CMakeFiles/Json.dir/cJSON.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Json.dir/cJSON.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/utils/cJSON.c > CMakeFiles/Json.dir/cJSON.c.i

Yggdrasil/utils/CMakeFiles/Json.dir/cJSON.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Json.dir/cJSON.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/utils/cJSON.c -o CMakeFiles/Json.dir/cJSON.c.s

# Object files for target Json
Json_OBJECTS = \
"CMakeFiles/Json.dir/cJSON.c.o"

# External object files for target Json
Json_EXTERNAL_OBJECTS =

../lib/libJson.a: Yggdrasil/utils/CMakeFiles/Json.dir/cJSON.c.o
../lib/libJson.a: Yggdrasil/utils/CMakeFiles/Json.dir/build.make
../lib/libJson.a: Yggdrasil/utils/CMakeFiles/Json.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library ../../../lib/libJson.a"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils && $(CMAKE_COMMAND) -P CMakeFiles/Json.dir/cmake_clean_target.cmake
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Json.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Yggdrasil/utils/CMakeFiles/Json.dir/build: ../lib/libJson.a

.PHONY : Yggdrasil/utils/CMakeFiles/Json.dir/build

Yggdrasil/utils/CMakeFiles/Json.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils && $(CMAKE_COMMAND) -P CMakeFiles/Json.dir/cmake_clean.cmake
.PHONY : Yggdrasil/utils/CMakeFiles/Json.dir/clean

Yggdrasil/utils/CMakeFiles/Json.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/utils /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils /home/jpantao/Git/BScResearch/Yggdrasil/cmake-build-debug/Yggdrasil/utils/CMakeFiles/Json.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Yggdrasil/utils/CMakeFiles/Json.dir/depend

