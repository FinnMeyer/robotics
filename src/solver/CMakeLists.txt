cmake_minimum_required(VERSION 2.8.3)
project(solver)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS message_generation dynamic_reconfigure roscpp std_msgs rosbag tf2_ros)
add_service_files(DIRECTORY srv FILES Reset.srv) 

 generate_dynamic_reconfigure_options(
  cfg/parameters.cfg 
)

generate_messages(DEPENDENCIES std_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS message_runtime)


include_directories(srv ${catkin_INCLUDE_DIRS})

add_executable(solver_node src/solverMain.cpp src/solverNode.cpp)
add_dependencies(solver_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(solver_node ${catkin_LIBRARIES})

add_executable(client src/client.cpp)
add_dependencies(client ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(client ${catkin_LIBRARIES})


