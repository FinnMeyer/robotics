cmake_minimum_required(VERSION 2.8.3)
project(amcl1)

find_package(catkin REQUIRED COMPONENTS roscpp std_msgs)

catkin_package()
include_directories(${catkin_INCLUDE_DIRS})
add_executable(amcl1 src/path.cpp)
target_link_libraries(amcl1 ${catkin_LIBRARIES})