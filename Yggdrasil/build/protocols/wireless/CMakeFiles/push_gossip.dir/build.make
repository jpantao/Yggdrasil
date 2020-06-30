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
include protocols/wireless/CMakeFiles/push_gossip.dir/depend.make

# Include the progress variables for this target.
include protocols/wireless/CMakeFiles/push_gossip.dir/progress.make

# Include the compile flags for this target's objects.
include protocols/wireless/CMakeFiles/push_gossip.dir/flags.make

protocols/wireless/CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.o: protocols/wireless/CMakeFiles/push_gossip.dir/flags.make
protocols/wireless/CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.o: ../protocols/wireless/communication/broadcast/push_gossip.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object protocols/wireless/CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless/communication/broadcast/push_gossip.c

protocols/wireless/CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless/communication/broadcast/push_gossip.c > CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.i

protocols/wireless/CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless/communication/broadcast/push_gossip.c -o CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.s

# Object files for target push_gossip
push_gossip_OBJECTS = \
"CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.o"

# External object files for target push_gossip
push_gossip_EXTERNAL_OBJECTS =

protocols/wireless/libpush_gossip.a: protocols/wireless/CMakeFiles/push_gossip.dir/communication/broadcast/push_gossip.c.o
protocols/wireless/libpush_gossip.a: protocols/wireless/CMakeFiles/push_gossip.dir/build.make
protocols/wireless/libpush_gossip.a: protocols/wireless/CMakeFiles/push_gossip.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libpush_gossip.a"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && $(CMAKE_COMMAND) -P CMakeFiles/push_gossip.dir/cmake_clean_target.cmake
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/push_gossip.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
protocols/wireless/CMakeFiles/push_gossip.dir/build: protocols/wireless/libpush_gossip.a

.PHONY : protocols/wireless/CMakeFiles/push_gossip.dir/build

protocols/wireless/CMakeFiles/push_gossip.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless && $(CMAKE_COMMAND) -P CMakeFiles/push_gossip.dir/cmake_clean.cmake
.PHONY : protocols/wireless/CMakeFiles/push_gossip.dir/clean

protocols/wireless/CMakeFiles/push_gossip.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/protocols/wireless /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/protocols/wireless/CMakeFiles/push_gossip.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : protocols/wireless/CMakeFiles/push_gossip.dir/depend
