#include <ros/ros.h>
#include <cstdlib>
#include "solverNode.h"

int main(int argc, char **argv)
{
    ros::init(argc, argv, "solver");
    solverNode solver;
    ros::Rate r(200);
    while (ros::ok())
    {
    solver.solver();
    ros::spinOnce();
    r.sleep();
    }
    return EXIT_SUCCESS;
}
