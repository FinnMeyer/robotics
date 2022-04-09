# include <ros/ros.h>
# include <nav_msgs/Odometry.h>
# include "kinematicsNode.h"
# include "sensor_msgs/JointState.h"
# include "geometry_msgs/TwistStamped.h"
# include <math.h>
#include <fstream>
#include <iostream>
//# include <iostream>
//# include <cstdlib>
//# include <algorithm>
//using namespace std;
/****************************
 * Public Functions
 ****************************/

/*
 */

/**
 * @brief Constructor for the kinematicsNode class
 */
kinematicsNode::kinematicsNode()
        : n_                       ()
        , nPriv_                   ("~")
        , Pub_(n_.advertise<geometry_msgs::TwistStamped>("/cmd_vel", 1000))
        , wheelDataSubscriber(n_.subscribe("/wheel_states", 1, &kinematicsNode::wheelDataCallback, this))

{
    //odometrySub_ = n_.subscribe("/odometry", 1, &kinematicsNode::odometryCallback, this);
    //carSensorsSub_ = n_.subscribe("/car_sensors", 1, &kinematicsNode::carSensorsCallback, this);

    // n_.getParam("/kinematics/kp", kp);
}

kinematicsNode::~kinematicsNode(){
};
/****************************
 * Private Functions
 * General information: Notes regarding the variables can be found at the declaration in the kinematicsNode.h file
 ****************************/


void kinematicsNode::wheelDataCallback(sensor_msgs::JointState msg){
    if(ticks == true){
        velocity[0] = msg.velocity[0];
        velocity[1] = msg.velocity[1];
        velocity[2] = msg.velocity[2];
        velocity[3] = msg.velocity[3];
    }
    else{
        velocity[0] = msg.position[0] * R;
        velocity[1] = msg.position[1] * R;
        velocity[2] = msg.position[2] * R;
        velocity[3] = msg.position[3] * R;
    }
    calculateRobot();
    Publish();
}

void kinematicsNode::calculateRobot(){
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 5; j++){
        states[i] = 0.25 * A[i][j] * velocity[j];
        }
    }
}
void kinematicsNode::Publish(){
    geometry_msgs::TwistStamped Kinematics;
     
    Kinematics.header.frame_id = "robot";
    Kinematics.header.stamp = ros::Time::now();
    Kinematics.twist.linear.x = states[0];
    Kinematics.twist.linear.y = states[1];
    Kinematics.twist.linear.z = 0;
    Kinematics.twist.angular.x = 0;
    Kinematics.twist.angular.y = 0;
    Kinematics.twist.angular.z = states[2];
    Pub_.publish(Kinematics);
     
  
}
 