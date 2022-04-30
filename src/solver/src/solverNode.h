#ifndef SOLVER_NODE_H_
#define SOLVER_NODE_H_

#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
# include "sensor_msgs/JointState.h"
# include "geometry_msgs/TwistStamped.h"
#include <tf2_ros/transform_broadcaster.h>
#include <fstream>
#include <iostream>
#include "solver/Reset.h"
class solverNode
{
private:
    geometry_msgs::TransformStamped transformStamped;
    tf2_ros::TransformBroadcaster br;
    ros::NodeHandle n_;
    ros::NodeHandle nPriv_;
    ros::Subscriber wheelDataSubscriber;
    ros::Publisher Pub_;
    void odometryCallback(geometry_msgs::TwistStamped msg);
    void Publish();
    void callback();
    void calculateEuler();
    void calculateRK();
public:
    solverNode();
    ~solverNode();
    void solver();
    double x = 0;
    double y = 0;
    double yaw = 0;
    double yawHalf = 0;
    bool euler = false;
    double v_x;
    double v_y;
    double yawrate;
    double x_old = 0;
    double y_old = 0;
    double yaw_old = 0;
    double delta = 1.0 / 200.0;
    bool start = false;
};


#endif  // SOLVER_NODE_H_
