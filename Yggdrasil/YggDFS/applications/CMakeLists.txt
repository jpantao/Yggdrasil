# Specify the minimum version for CMake

cmake_minimum_required(VERSION 2.8)

# Project's name
project(YggDFS_Applications)

# Yggdrasil dependencies
include_directories(../../)
include_directories(../../../Yggdrasil-LowLevelLib)

# Flag required by FUSE
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_FILE_OFFSET_BITS=64")

# Executables
add_executable(YggDFS yggdfs.c)
target_link_libraries(YggDFS ${FUSE_LIBRARIES})
