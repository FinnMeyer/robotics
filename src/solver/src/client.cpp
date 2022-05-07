#include "ros/ros.h"
#include "solver/Reset.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "reset_client");
  if (argc != 4)
  {
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<solver::Reset>("reset");
  solver::Reset srv;
  srv.request.x = 1.0;
  srv.request.y = 1.0;
  srv.request.yaw = 0.0;
  if (client.call(srv))
  {
    ROS_INFO("updated odometry tf");
  }
  else
  {
    ROS_ERROR("Failed to call service reset");
    return 1;
  }

  return 0;
}
