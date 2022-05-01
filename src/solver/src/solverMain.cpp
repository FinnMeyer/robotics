#include <ros/ros.h>
#include <cstdlib>
#include "solverNode.h"



#include "std_msgs/String.h"
#include "solver/Reset.h"

#include <sstream>
#include <bitset>

#include <dynamic_reconfigure/server.h>
#include <solver/parametersConfig.h>

bool reset_callback(solverNode * solve, solver::Reset::Request  &req, 
                    solver::Reset::Response &res) {
    res.old_x = solve->x;
    solve->x_old = req.x;
    solve->x = req.x;

    res.old_y = solve->y;
    solve->y_old = req.y;
    solve->y = req.x;

    res.old_yaw = solve->yaw;
    solve->yaw_old = req.yaw;
    solve->yaw = req.yaw;
    ROS_INFO("Changed values");
    return true;
}

void param_callback(solverNode * solve, solver::parametersConfig &config, uint32_t level) {
    solve->euler = config.fmt;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "solver");
    ros::NodeHandle n;
    solverNode * pointer = new solverNode;
    dynamic_reconfigure::Server<solver::parametersConfig> dynServer;
    dynamic_reconfigure::Server<solver::parametersConfig>::CallbackType f;
    f = boost::bind(&param_callback, pointer, _1, _2);
    dynServer.setCallback(f);
    ros::ServiceServer service = 
    n.advertiseService<solver::Reset::Request, solver::Reset::Response>("reset",boost::bind(&reset_callback, pointer, _1, _2));
    ros::Rate r(200);
    while (ros::ok())
    {
    pointer->solver();
    ros::spinOnce();
    r.sleep();
    }
    return EXIT_SUCCESS;
}