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
include core/CMakeFiles/yggcore_wireless_new.dir/depend.make

# Include the progress variables for this target.
include core/CMakeFiles/yggcore_wireless_new.dir/progress.make

# Include the compile flags for this target's objects.
include core/CMakeFiles/yggcore_wireless_new.dir/flags.make

core/CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.o: ../core/ygg_runtime.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/ygg_runtime.c

core/CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/ygg_runtime.c > CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.i

core/CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/ygg_runtime.c -o CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.s

core/CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.o: ../core/proto_data_struct.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/proto_data_struct.c

core/CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/proto_data_struct.c > CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.i

core/CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/proto_data_struct.c -o CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.s

core/CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.o: ../core/utils/utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/utils.c

core/CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/utils.c > CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.i

core/CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/utils.c -o CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.s

core/CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.o: ../core/utils/queue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/queue.c

core/CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/queue.c > CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.i

core/CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/queue.c -o CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.s

core/CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.o: ../core/utils/queue_elem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/queue_elem.c

core/CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/queue_elem.c > CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.i

core/CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/utils/queue_elem.c -o CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.s

core/CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.o: ../core/protos/timer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/timer.c

core/CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/timer.c > CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.i

core/CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/timer.c -o CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.s

core/CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.o: ../core/protos/executor.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/executor.c

core/CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/executor.c > CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.i

core/CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/executor.c -o CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.s

core/CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.o: core/CMakeFiles/yggcore_wireless_new.dir/flags.make
core/CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.o: ../core/protos/wireless/dispatcher.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object core/CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.o"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.o   -c /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/wireless/dispatcher.c

core/CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.i"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/wireless/dispatcher.c > CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.i

core/CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.s"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core/protos/wireless/dispatcher.c -o CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.s

# Object files for target yggcore_wireless_new
yggcore_wireless_new_OBJECTS = \
"CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.o" \
"CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.o"

# External object files for target yggcore_wireless_new
yggcore_wireless_new_EXTERNAL_OBJECTS =

core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/ygg_runtime.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/proto_data_struct.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/utils/utils.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/utils/queue.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/utils/queue_elem.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/protos/timer.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/protos/executor.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/protos/wireless/dispatcher.c.o
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/build.make
core/libyggcore_wireless_new.a: core/CMakeFiles/yggcore_wireless_new.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library libyggcore_wireless_new.a"
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && $(CMAKE_COMMAND) -P CMakeFiles/yggcore_wireless_new.dir/cmake_clean_target.cmake
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yggcore_wireless_new.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
core/CMakeFiles/yggcore_wireless_new.dir/build: core/libyggcore_wireless_new.a

.PHONY : core/CMakeFiles/yggcore_wireless_new.dir/build

core/CMakeFiles/yggcore_wireless_new.dir/clean:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core && $(CMAKE_COMMAND) -P CMakeFiles/yggcore_wireless_new.dir/cmake_clean.cmake
.PHONY : core/CMakeFiles/yggcore_wireless_new.dir/clean

core/CMakeFiles/yggcore_wireless_new.dir/depend:
	cd /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/core /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core /home/jpantao/Git/BScResearch/Yggdrasil/Yggdrasil/build/core/CMakeFiles/yggcore_wireless_new.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : core/CMakeFiles/yggcore_wireless_new.dir/depend

