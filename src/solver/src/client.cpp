#include "ros/ros.h"
#include "solver/Reset.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "reset_client");
  if (argc != 2)
  {
    ROS_INFO("usage: reset_client new_count");
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<solver::Reset>("reset");
  solver::Reset srv;
  srv.request.x = 1;
  if (client.call(srv))
  {
    ROS_INFO("Old count: %ld", (long int)srv.response.old_x);
  }
  else
  {
    ROS_ERROR("Failed to call service reset");
    return 1;
  }

  return 0;
}
