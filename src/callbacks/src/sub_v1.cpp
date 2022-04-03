#include "ros/ros.h"
#include "std_msgs/Int32.h"

void countCallback(int *s, const std_msgs::Int32::ConstPtr& msg) {
  ROS_INFO("Received: %d", msg->data);

  // s is a pointer to main::sum 
  // --> we can read and write on it using the * operator!
  *s = *s + msg->data;
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "focus_sub");
  ros::NodeHandle n;

  int sum = 0;

  ros::Subscriber sub = n.subscribe<std_msgs::Int32>("count", 1000, 
      boost::bind(&countCallback, &sum, _1));

  ros::Rate loop_rate(10);

  while (ros::ok()) {

    ROS_INFO("Current sum: %d", sum);

    ros::spinOnce();
    
    loop_rate.sleep();
  }


  return 0;
}
