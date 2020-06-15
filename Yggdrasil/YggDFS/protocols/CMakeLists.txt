# Specify the minimum version for CMake

cmake_minimum_required(VERSION 2.8)

# Project's name
project(YggDFS_Protocols)

include_directories(../../)

link_libraries(yggcore_wireless_new)

add_library(discovery discovery.c)
add_library(routing batman.c)

target_link_libraries(discovery PUBLIC discovery_interface)
target_link_libraries(routing PUBLIC routing_interface)
