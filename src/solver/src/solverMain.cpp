#include <ros/ros.h>
#include <cstdlib>
#include "solverNode.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "solver");
    solverNode solver;
    ros::spin();
    return EXIT_SUCCESS;
}
