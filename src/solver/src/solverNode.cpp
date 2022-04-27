# include <ros/ros.h>
# include <nav_msgs/Odometry.h>
# include "solverNode.h"
# include "sensor_msgs/JointState.h"
# include "geometry_msgs/TwistStamped.h"
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>

//using namespace std;
/****************************
 * Public Functions
 ****************************/

/*
 */

/**
 * @brief Constructor for the solverNode class
 */
solverNode::solverNode()
        : n_                       ()
        , nPriv_                   ("~")
        , Pub_(n_.advertise<nav_msgs::Odometry>("/odom", 1000))
        , wheelDataSubscriber(n_.subscribe("/cmd_vel", 1, &solverNode::odometryCallback, this))

{
    //odometrySub_ = n_.subscribe("/odometry", 1, &solverNode::odometryCallback, this);
    //carSensorsSub_ = n_.subscribe("/car_sensors", 1, &solverNode::carSensorsCallback, this);

    n_.getParam("/solver/x", x);
    n_.getParam("/solver/y", y);
    n_.getParam("/solver/yaw", yaw);
}

solverNode::~solverNode(){
};
/****************************
 * Private Functions
 * General information: Notes regarding the variables can be found at the declaration in the solverNode.h file
 ****************************/

void solverNode::odometryCallback(geometry_msgs::TwistStamped msg){
    v_x = msg.twist.linear.x;
    v_y = msg.twist.linear.y;
    yawrate = msg.twist.angular.z;
    start = true;
}
void solverNode::solver(){
    if(euler == true){
        calculateEuler();
    }
    else{
        calculateRK();
    }
    callback();
    Publish();

}
void solverNode::calculateEuler(){
    if(start == true){
    yaw = yaw_old + delta * yawrate;
    x = x_old + delta * (v_x * cos(yaw) - sin(yaw) * v_y);
    y = y_old + delta * (v_x * sin(yaw) + cos(yaw) * v_y);
    yaw_old = yaw;
    x_old = x;
    y_old = y;
    }
}
void solverNode::calculateRK(){
    if(start == true){
    yaw = yaw_old + delta * yawrate;
    yawHalf = yaw_old + (delta / 2 * yawrate);
    x = x_old + delta * (v_x * cos(yawHalf) - sin(yawHalf) * v_y);
    y = y_old + delta * (v_x * sin(yawHalf) + cos(yawHalf) * v_y);

    yaw_old = yaw;
    x_old = x;
    y_old = y;
    }
}

void solverNode::callback(){
    // set header
    transformStamped.header.stamp = ros::Time::now();
    transformStamped.header.frame_id = "world";
    transformStamped.child_frame_id = "base_link";
    // set x,y
    transformStamped.transform.translation.x = x;
    transformStamped.transform.translation.y = y;
    transformStamped.transform.translation.z = 0.0;
    // set theta
    tf2::Quaternion q;
    q.setRPY(0, 0, yaw);
    transformStamped.transform.rotation.x = q.x();
    transformStamped.transform.rotation.y = q.y();
    transformStamped.transform.rotation.z = q.z();
    transformStamped.transform.rotation.w = q.w();
    // send transform
    br.sendTransform(transformStamped);
}
void solverNode::Publish(){
    nav_msgs::Odometry solver;
    tf2::Quaternion q;
    q.setRPY(0, 0, yaw);
    solver.header.frame_id = "world";
    solver.header.stamp = ros::Time::now();
    solver.pose.pose.position.x = x;
    solver.pose.pose.position.y = y;
    solver.pose.pose.orientation.x = q.x();
    solver.pose.pose.orientation.y = q.y();
    solver.pose.pose.orientation.z = q.z();
    solver.pose.pose.orientation.w = q.w();
    Pub_.publish(solver);
}
 