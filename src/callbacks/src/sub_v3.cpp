#include "ros/ros.h"
#include "std_msgs/Int32.h"

class Subscriber {
public:
  Subscriber() { // class constructor
    // all initializations here
    this->sub = this->n.subscribe("count", 1000, &Subscriber::countCallback, this);
    this->pub = this->n.advertise<std_msgs::Int32>("sum", 1000);
    this->sum = 0;
  }

  void main_loop() {
    ros::Rate loop_rate(10);

    while (ros::ok()) {

      ROS_INFO("Current sum: %d", this->sum);

      ros::spinOnce();

      loop_rate.sleep();
    }
  }

  void countCallback(const std_msgs::Int32::ConstPtr& msg) {
    ROS_INFO("Received: %d", msg->data);

    // sum is a member variable (i.e., it is defined inside the class)
    // --> we can access it from anywhere inside the class (using "this->")!
    this->sum = this->sum + msg->data;

    // We can use this->pub without advertising it every time
    // (advertising it every time would have been very inefficient)
    std_msgs::Int32 sum_msg;
    sum_msg.data = this->sum;
    this->pub.publish(sum_msg);
  }

private:
  ros::NodeHandle n; 
  ros::Subscriber sub;
  ros::Publisher pub;
  int sum;
};

int main(int argc, char **argv) {
  ros::init(argc, argv, "callbacks_sub");
  
  Subscriber my_subscriber; // constructor is called

  my_subscriber.main_loop();

  return 0;
}
