# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/robotics/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/robotics/build

# Include any dependencies generated for this target.
include solver/CMakeFiles/client.dir/depend.make

# Include the progress variables for this target.
include solver/CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include solver/CMakeFiles/client.dir/flags.make

solver/CMakeFiles/client.dir/src/client.cpp.o: solver/CMakeFiles/client.dir/flags.make
solver/CMakeFiles/client.dir/src/client.cpp.o: /home/ubuntu/robotics/src/solver/src/client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/robotics/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object solver/CMakeFiles/client.dir/src/client.cpp.o"
	cd /home/ubuntu/robotics/build/solver && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/src/client.cpp.o -c /home/ubuntu/robotics/src/solver/src/client.cpp

solver/CMakeFiles/client.dir/src/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/src/client.cpp.i"
	cd /home/ubuntu/robotics/build/solver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/robotics/src/solver/src/client.cpp > CMakeFiles/client.dir/src/client.cpp.i

solver/CMakeFiles/client.dir/src/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/src/client.cpp.s"
	cd /home/ubuntu/robotics/build/solver && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/robotics/src/solver/src/client.cpp -o CMakeFiles/client.dir/src/client.cpp.s

solver/CMakeFiles/client.dir/src/client.cpp.o.requires:

.PHONY : solver/CMakeFiles/client.dir/src/client.cpp.o.requires

solver/CMakeFiles/client.dir/src/client.cpp.o.provides: solver/CMakeFiles/client.dir/src/client.cpp.o.requires
	$(MAKE) -f solver/CMakeFiles/client.dir/build.make solver/CMakeFiles/client.dir/src/client.cpp.o.provides.build
.PHONY : solver/CMakeFiles/client.dir/src/client.cpp.o.provides

solver/CMakeFiles/client.dir/src/client.cpp.o.provides.build: solver/CMakeFiles/client.dir/src/client.cpp.o


# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/src/client.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

/home/ubuntu/robotics/devel/lib/solver/client: solver/CMakeFiles/client.dir/src/client.cpp.o
/home/ubuntu/robotics/devel/lib/solver/client: solver/CMakeFiles/client.dir/build.make
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libtf2_ros.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libactionlib.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libmessage_filters.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libroscpp.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/librosconsole.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libtf2.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/librostime.so
/home/ubuntu/robotics/devel/lib/solver/client: /opt/ros/melodic/lib/libcpp_common.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/ubuntu/robotics/devel/lib/solver/client: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/ubuntu/robotics/devel/lib/solver/client: solver/CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/robotics/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ubuntu/robotics/devel/lib/solver/client"
	cd /home/ubuntu/robotics/build/solver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
solver/CMakeFiles/client.dir/build: /home/ubuntu/robotics/devel/lib/solver/client

.PHONY : solver/CMakeFiles/client.dir/build

solver/CMakeFiles/client.dir/requires: solver/CMakeFiles/client.dir/src/client.cpp.o.requires

.PHONY : solver/CMakeFiles/client.dir/requires

solver/CMakeFiles/client.dir/clean:
	cd /home/ubuntu/robotics/build/solver && $(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : solver/CMakeFiles/client.dir/clean

solver/CMakeFiles/client.dir/depend:
	cd /home/ubuntu/robotics/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/robotics/src /home/ubuntu/robotics/src/solver /home/ubuntu/robotics/build /home/ubuntu/robotics/build/solver /home/ubuntu/robotics/build/solver/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : solver/CMakeFiles/client.dir/depend
