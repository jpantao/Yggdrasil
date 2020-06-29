# Specify the minimum version for CMake

cmake_minimum_required(VERSION 2.8)

# Project's name
project(AntDFS_Applications)

# Yggdrasil dependencies

include_directories(../utils)
include_directories(../../)
include_directories(../../../Yggdrasil-LowLevelLib)

add_library(log log.c)

add_library(antdfs_fuse antdfs_fuse.c)
target_link_libraries(antdfs_fuse PUBLIC antdfs_utils log)

# Required to use threads
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

# Required by FUSE
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_FILE_OFFSET_BITS=64")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -Wall --pedantic -g")
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake" ${CMAKE_MODULE_PATH})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

find_package(FUSE REQUIRED)

include_directories(${FUSE_INCLUDE_DIR})
# Executables
add_executable(AntDFS antdfs_control.c)
target_link_libraries(AntDFS ${FUSE_LIBRARIES})
target_link_libraries(AntDFS yggcore_wireless_new)
target_link_libraries(AntDFS antdfs_utils)
target_link_libraries(AntDFS discovery)
target_link_libraries(AntDFS reliable_dissemination)
target_link_libraries(AntDFS routing)
target_link_libraries(AntDFS log)
target_link_libraries(AntDFS antdfs_fuse)
target_link_libraries(AntDFS hashtable)