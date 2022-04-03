# include <ros/ros.h>
# include <nav_msgs/Odometry.h>
# include "kinematicsNode.h"
# include "sensor_msgs/JointState.h"
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
        //, controlPub_(n_.advertise<egn_messages::DVControlOutput>("dv_control_output", 1))
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
}

void kinematicsNode::calculateRobot(){
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 5; j++){
        states[i] = 0.25 * A[i][j] * velocity[j];
        }
    }
    std::cerr<< states[0] << std::endl;
}
   /*
void kinematicsNode::PublishTorque(){
 
    egn_messages::DVControlOutput RecommendedkinematicserTorque;
    RecommendedkinematicserTorque.header.frame_id = "world";
    RecommendedkinematicserTorque.header.stamp = ros::Time::now();
    RecommendedkinematicserTorque.steerAngleSetpoint = AngleSetpoint;
    RecommendedkinematicserTorque.drsState = drsState;
    RecommendedkinematicserTorque.disciplinFinished = skidpadFinished;
    RecommendedkinematicserTorque.speedTarget = speedRef;
    for (int i = 0; i < 4; i++) {
        // < muss auch geändert werden
        if(torqueSetpoint > torqueFromPid[i] && v_W[i] > 0 && v_R[i] > 0 && s_L[i] > 0 && torqueFromPid[i] > 0 && kinematicsActivation == true){
            RecommendedkinematicserTorque.torqueSetpoint = torqueFromPid[0];
            finalTorque[i] = torqueFromPid[0];
        }
        else if(torqueSetpoint < torqueFromPid[i] && v_W[i] > 0 && v_R[i] > 0 && s_L[i] < 0 && kinematicsBreaking == true){
            RecommendedkinematicserTorque.torqueSetpoint = torqueFromPid[0];
            finalTorque[i] = torqueFromPid[0];
        }
        else{
            RecommendedkinematicserTorque.torqueSetpoint = torqueSetpoint;
            finalTorque[i] = torqueSetpoint;
        }
    }
    controlPub_.publish(RecommendedkinematicserTorque);
  
}
  */