#include "ros/ros.h"
#include "std_msgs/Int32.h"

void countCallback(const std_msgs::Int32::ConstPtr& msg) {
  ROS_INFO("Received: %d", msg->data);
  
  // sum = sum + msg->data; // ERROR --> cannot see main::sum !
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "callbacks_sub");
  ros::NodeHandle n;

  int sum = 0;

  ros::Subscriber sub = n.subscribe("count", 1000, countCallback);

  ros::Rate loop_rate(10);

  while (ros::ok()) {
    
    ROS_INFO("Current sum: %d", sum);

    ros::spinOnce();

    loop_rate.sleep();
  }


  return 0;
}
