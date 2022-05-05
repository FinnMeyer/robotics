# include <ros/ros.h>
# include <nav_msgs/Odometry.h>
# include "solverNode.h"
# include "sensor_msgs/JointState.h"
# include "geometry_msgs/TwistStamped.h"
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_ros/transform_broadcaster.h>
#include "solver/Reset.h"

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
    n_.getParam("/solver/x", xodom);
    n_.getParam("/solver/y", yodom);
    n_.getParam("/solver/yaw", yawodom);
    callback();
    SetBaseLink(xodom*2,yodom*2,yawodom*2);
}

solverNode::~solverNode(){
};
/****************************
 * Private Functions
 * General information: Notes regarding the variables can be found at the declaration in the solverNode.h file
 ****************************/

void solverNode::odometryCallback(geometry_msgs::TwistStamped msg){
    if(start == true){
        v_x = msg.twist.linear.x;
        v_y = msg.twist.linear.y;
        yawrate = msg.twist.angular.z;
        delta = msg.header.stamp.toSec() - oldStamp;
        if(delta < 0.001){
            delta = 0.001;
        }
        std::cerr<< delta << std::endl;
        solver();
        }   
    oldStamp = msg.header.stamp.toSec();
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
    yaw = yaw_old + delta * yawrate;
    x = x_old + delta * (v_x * cos(yaw_old) - sin(yaw_old) * v_y);
    y = y_old + delta * (v_x * sin(yaw_old) + cos(yaw_old) * v_y);


    v_x = (v_x * cos(yaw) - sin(yaw) * v_y);
    v_y = (v_x * sin(yaw) + cos(yaw) * v_y);
    yaw_old = yaw;
    x_old = x;
    y_old = y;
}
void solverNode::calculateRK(){
    yaw = yaw_old + delta * yawrate;
    yawHalf = yaw_old + (delta / 2 * yawrate);
    x = x_old + delta * (v_x * cos(yawHalf) - sin(yawHalf) * v_y);
    y = y_old + delta * (v_x * sin(yawHalf) + cos(yawHalf) * v_y);

    v_x = (v_x * cos(yaw) - sin(yaw) * v_y);
    v_y = (v_x * sin(yaw) + cos(yaw) * v_y);

    yaw_old = yaw;
    x_old = x;
    y_old = y;
}

void solverNode::callback(){
        // set header
    transformStamped.header.stamp = ros::Time::now();
    transformStamped.header.frame_id = "world";
    transformStamped.child_frame_id = "odom";
    // set x,y
    std::cerr<< xodom << std::endl;
    transformStamped.transform.translation.x = xodom;
    transformStamped.transform.translation.y = yodom;
    transformStamped.transform.translation.z = 0.0;
    // set theta
    tf2::Quaternion qq;
    qq.setRPY(0, 0, yawodom);
    transformStamped.transform.rotation.x = qq.x();
    transformStamped.transform.rotation.y = qq.y();
    transformStamped.transform.rotation.z = qq.z();
    transformStamped.transform.rotation.w = qq.w();
    // send transform
    bt.sendTransform(transformStamped);

    // set header
    transformStamped.header.stamp = ros::Time::now();
    transformStamped.header.frame_id = "odom";
    transformStamped.child_frame_id = "base_link";
    // set x,y
    std::cerr<< x << std::endl;
    transformStamped.transform.translation.x = x-xodom;
    transformStamped.transform.translation.y = y-yodom;
    transformStamped.transform.translation.z = 0.0;
    // set theta
    tf2::Quaternion q;
    q.setRPY(0, 0, (yaw-yawodom));
    transformStamped.transform.rotation.x = q.x();
    transformStamped.transform.rotation.y = q.y();
    transformStamped.transform.rotation.z = q.z();
    transformStamped.transform.rotation.w = q.w();
    // send transform
    br.sendTransform(transformStamped);
}
void solverNode::SetBaseLink(double x1, double y1, double yaw1){
    // set header
    transformStamped.header.stamp = ros::Time::now();
    transformStamped.header.frame_id = "odom";
    transformStamped.child_frame_id = "base_link";
    // set x,y
    transformStamped.transform.translation.x = x1;
    transformStamped.transform.translation.y = y1;
    transformStamped.transform.translation.z = 0.0;
    // set theta
    tf2::Quaternion q;
    q.setRPY(0, 0, yaw1);
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
    solver.header.frame_id = "odom";
    solver.header.stamp = ros::Time::now();
    solver.pose.pose.position.x = x;
    solver.pose.pose.position.y = y;
    solver.pose.pose.position.z = 0.0;
    solver.pose.pose.orientation.x = q.x();
    solver.pose.pose.orientation.y = q.y();
    solver.pose.pose.orientation.z = q.z();
    solver.pose.pose.orientation.w = q.w();
    solver.twist.twist.linear.x = v_x;
    solver.twist.twist.linear.y = v_y;
    solver.twist.twist.linear.x = 0.0;
    Pub_.publish(solver);
}
 