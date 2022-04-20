#ifndef KINEMATICS_NODE_H_
#define KINEMATICS_NODE_H_

#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
# include "sensor_msgs/JointState.h"
# include "geometry_msgs/TwistStamped.h"
#include <fstream>
#include <iostream>
class kinematicsNode
{
private:
    ros::NodeHandle n_;
    ros::NodeHandle nPriv_;
    ros::Subscriber wheelDataSubscriber;
    ros::Publisher Pub_;
    void wheelDataCallback(sensor_msgs::JointState msg);
    void Publish();
    void calculateRobot();
    double R = 0.07;
    double l = 0.2;
    double w = 0.169;
    bool ticks = false;
    double velocity[4];
    double states[3];
    double A [3][4] =  {{1, 1, 1, 1},
                        {-1, 1, 1, -1},
                        {-1/(l + w), 1/(l + w), -1/(l + w), 1/(l + w)}};


public:
    kinematicsNode();
    ~kinematicsNode();
};


#endif  // KINEMATICS_NODE_H_
