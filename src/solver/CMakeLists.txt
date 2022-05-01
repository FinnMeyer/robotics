cmake_minimum_required(VERSION 2.8.3)
project(solver)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs tf2_ros message_generation dynamic_reconfigure)
add_service_files(DIRECTORY srv FILES Reset.srv)
generate_messages(
   DEPENDENCIES
   std_msgs
 )

 generate_dynamic_reconfigure_options(
  cfg/parameters.cfg
  
)

## Declare a catkin package
catkin_package()

## Build talker and listener

include_directories(include ${catkin_INCLUDE_DIRS})
include_directories(srv ${catkin_INCLUDE_DIRS})

add_executable(solver_node src/solverMain.cpp src/solverNode.cpp)
add_dependencies(solver_node ${catkin_EXPORTED_TARGETS})
target_link_libraries(solver_node ${catkin_LIBRARIES})

add_executable(client src/client.cpp)
add_dependencies(client ${catkin_EXPORTED_TARGETS})

target_link_libraries(client ${catkin_LIBRARIES})


