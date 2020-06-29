# Specify the minimum version for CMake

cmake_minimum_required(VERSION 2.8)

# Project's name
project(AntDFS_Utils)

include_directories(../../)

add_library(antdfs_utils antdfs_utils.c)
add_library(hashfunctions hashfunctions.c)
add_library(hashtable hashtable.c)

target_link_libraries(hashtable PUBLIC hashfunctions)

