#include <ros/ros.h>
#include <cstdlib>
#include "solverNode.h"



#include "std_msgs/String.h"
#include "solver/Reset.h"
#include <dynamic_reconfigure/server.h>
#include <solver/parametersConfig.h>

#include <sstream>
#include <bitset>



bool reset_callback(int *count, solver::Reset::Request  &req, 
                    solver::Reset::Response &res) {
  res.old_count = *count;
  *count = req.new_count;
  ROS_INFO("Request to reset count to %ld - Responding with old count: %ld", 
      (long int)req.new_count, (long int)res.old_count);
  return true;
}

void param_callback(bool *mode, int* fmt, solver::parametersConfig &config, uint32_t level) {
  ROS_INFO("Reconfigure Request: %s %d - Level %d",
            config.mode?"True":"False", 
            config.fmt,
            level);
  
  *mode = config.mode;
  *fmt = config.fmt;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "solver");
    ros::NodeHandle n;

    int count = 0;
    bool mode = true;
    int fmt = 0;

    dynamic_reconfigure::Server<solver::parametersConfig> dynServer;
    dynamic_reconfigure::Server<solver::parametersConfig>::CallbackType f;
    f = boost::bind(&param_callback, &mode, &fmt, _1, _2);
    dynServer.setCallback(f);

    ros::ServiceServer service = 
    n.advertiseService<solver::Reset::Request, solver::Reset::Response>("reset",boost::bind(&reset_callback, &count, _1, _2));
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