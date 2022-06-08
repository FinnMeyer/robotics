cmake_minimum_required(VERSION 2.8.3)
project(mapping)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs message_generation tf REQUIRED)

generate_messages(
   DEPENDENCIES
   std_msgs
   tf
 )
## Declare a catkin package
catkin_package()
include_directories(${catkin_INCLUDE_DIRS})
add_executable(mapping1 src/odom.cpp)
target_link_libraries(mapping1 ${catkin_LIBRARIES})