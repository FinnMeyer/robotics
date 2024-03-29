#include <ros/ros.h>
#include <cstdlib>
#include "solverNode.h"



#include "std_msgs/String.h"
#include "solver/Reset.h"


#include <dynamic_reconfigure/server.h>
#include <solver/parametersConfig.h>

bool reset_callback(solverNode * solve, solver::Reset::Request  &req, 
                    solver::Reset::Response &res) {
    res.old_x = solve->x;
    solve->x = 0;
    solve->x_old = 0;
    solve->xodom = req.x;

    res.old_y = solve->y;
    solve->y = 0;
    solve->y_old = 0;
    solve->yodom = req.y;

    res.old_yaw = solve->yaw;
    solve->yaw = 0;
    solve->yaw_old = 0;
    solve->yawodom = req.yaw;
    ROS_INFO("Changed values");
    return true;
}

void param_callback(solverNode * solve, solver::parametersConfig &config, uint32_t level) {
    if(config.fmt == 0){
        solve->euler =true;
        ROS_INFO("Changed to Euler");
    }
    else if (config.fmt == 1)
    {
        solve->euler =false;
        ROS_INFO("Changed to RK");
    }  

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
    ros::spin();
    return EXIT_SUCCESS;
}