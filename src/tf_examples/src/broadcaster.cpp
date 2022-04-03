#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include <tf/transform_broadcaster.h>

class TfBroad {
public:
  TfBroad() {
    sub = n.subscribe("/turtle1/pose", 1000, &TfBroad::callback, this);
  } 

  void callback(const turtlesim::Pose::ConstPtr& msg) {
    // set x,y
    transform.setOrigin( tf::Vector3(msg->x, msg->y, 0) );
    // set theta
    tf::Quaternion q;
    q.setRPY(0, 0, msg->theta);
    transform.setRotation(q);
    // send transform
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "turtle"));
  }

private:
  ros::NodeHandle n; 
  tf::TransformBroadcaster br;
  tf::Transform transform;
  ros::Subscriber sub;
};


int main(int argc, char **argv) {
  ros::init(argc, argv, "tf_broadcast");
  TfBroad my_tf_broadcaster;
  ros::spin();
  return 0;
}
