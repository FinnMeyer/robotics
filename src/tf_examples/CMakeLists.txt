cmake_minimum_required(VERSION 2.8.3)
project(tf_examples)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs tf tf2 tf2_ros turtlesim)

## Declare a catkin package
catkin_package()

## Build talker and listener
include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(tf_broad src/broadcaster.cpp)
target_link_libraries(tf_broad ${catkin_LIBRARIES})

add_executable(tf2_broad src/broadcaster_tf2.cpp)
target_link_libraries(tf2_broad ${catkin_LIBRARIES})
