cmake_minimum_required(VERSION 2.8.3)
project(fuse)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp tf std_msgs message_generation REQUIRED)

generate_messages(
   DEPENDENCIES
   std_msgs
   tf
 )
## Declare a catkin package
catkin_package()

include_directories(${catkin_INCLUDE_DIRS})