cmake_minimum_required(VERSION 2.8.3)
project(callbacks)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs)

## Declare a catkin package
catkin_package()

## Build talker and listener

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(pub_callbacks src/pub.cpp)
add_dependencies(pub_callbacks ${catkin_EXPORTED_TARGETS})
target_link_libraries(pub_callbacks ${catkin_LIBRARIES})

add_executable(sub_callbacks_base src/sub_base.cpp)
add_dependencies(sub_callbacks_base ${catkin_EXPORTED_TARGETS})
target_link_libraries(sub_callbacks_base ${catkin_LIBRARIES})

add_executable(sub_callbacks_v1 src/sub_v1.cpp)
add_dependencies(sub_callbacks_v1 ${catkin_EXPORTED_TARGETS})
target_link_libraries(sub_callbacks_v1 ${catkin_LIBRARIES})

add_executable(sub_callbacks_v2 src/sub_v2.cpp)
add_dependencies(sub_callbacks_v2 ${catkin_EXPORTED_TARGETS})
target_link_libraries(sub_callbacks_v2 ${catkin_LIBRARIES})

add_executable(sub_callbacks_v3 src/sub_v3.cpp)
add_dependencies(sub_callbacks_v3 ${catkin_EXPORTED_TARGETS})
target_link_libraries(sub_callbacks_v3 ${catkin_LIBRARIES})
