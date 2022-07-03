#include "ros/ros.h"
#include "std_msgs/String.h"
#include "nav_msgs/Odometry.h"
#include "nav_msgs/Path.h"
#include "geometry_msgs/Pose.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include <tf/transform_broadcaster.h>

class pub_sub
{

nav_msgs::Path path;

geometry_msgs::PoseStamped pose;
private:
ros::NodeHandle n; 

ros::Subscriber sub;
ros::Subscriber sub2;
ros::Publisher pub; 
ros::Timer timer1;
	
	
public:
  	pub_sub()
	: n                       ()
	, pub(n.advertise<nav_msgs::Path>("/path", 1000))
	{
  	sub = n.subscribe("/amcl_pose", 1, &pub_sub::callback, this);
}
void callback(const geometry_msgs::PoseWithCovarianceStamped &msg){
	pose.pose.position = msg.pose.pose.position;
	path.header.frame_id = "/map";
	pose.pose.orientation = msg.pose.pose.orientation;
	path.poses.push_back(pose);
	pub.publish(path);
}
};

int main(int argc, char **argv)
{	
 	ros::init(argc, argv, "subscribe_and_publish");
 	pub_sub my_pub_sub;
 	ros::spin();
 	return 0;
}
