// Auto-generated. Do not edit!

// (in-package solver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ResetRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResetRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResetRequest
    let len;
    let data = new ResetRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'solver/ResetRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '47802147045815b06859cca542c21d31';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 x
    float32 y
    float32 yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResetRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    return resolved;
    }
};

class ResetResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.old_x = null;
      this.old_y = null;
      this.old_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('old_x')) {
        this.old_x = initObj.old_x
      }
      else {
        this.old_x = 0.0;
      }
      if (initObj.hasOwnProperty('old_y')) {
        this.old_y = initObj.old_y
      }
      else {
        this.old_y = 0.0;
      }
      if (initObj.hasOwnProperty('old_yaw')) {
        this.old_yaw = initObj.old_yaw
      }
      else {
        this.old_yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResetResponse
    // Serialize message field [old_x]
    bufferOffset = _serializer.float32(obj.old_x, buffer, bufferOffset);
    // Serialize message field [old_y]
    bufferOffset = _serializer.float32(obj.old_y, buffer, bufferOffset);
    // Serialize message field [old_yaw]
    bufferOffset = _serializer.float32(obj.old_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResetResponse
    let len;
    let data = new ResetResponse(null);
    // Deserialize message field [old_x]
    data.old_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [old_y]
    data.old_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [old_yaw]
    data.old_yaw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'solver/ResetResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a7eb1d70d88e6f2247ba417db0eca7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 old_x
    float32 old_y
    float32 old_yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResetResponse(null);
    if (msg.old_x !== undefined) {
      resolved.old_x = msg.old_x;
    }
    else {
      resolved.old_x = 0.0
    }

    if (msg.old_y !== undefined) {
      resolved.old_y = msg.old_y;
    }
    else {
      resolved.old_y = 0.0
    }

    if (msg.old_yaw !== undefined) {
      resolved.old_yaw = msg.old_yaw;
    }
    else {
      resolved.old_yaw = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: ResetRequest,
  Response: ResetResponse,
  md5sum() { return '1d0483a5373f8cadf48c1a80ae178886'; },
  datatype() { return 'solver/Reset'; }
};
