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
      this.new_count = null;
    }
    else {
      if (initObj.hasOwnProperty('new_count')) {
        this.new_count = initObj.new_count
      }
      else {
        this.new_count = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResetRequest
    // Serialize message field [new_count]
    bufferOffset = _serializer.int64(obj.new_count, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResetRequest
    let len;
    let data = new ResetRequest(null);
    // Deserialize message field [new_count]
    data.new_count = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'solver/ResetRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9d4a4f279878d5dcb73fce49c1644609';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 new_count
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResetRequest(null);
    if (msg.new_count !== undefined) {
      resolved.new_count = msg.new_count;
    }
    else {
      resolved.new_count = 0
    }

    return resolved;
    }
};

class ResetResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.old_count = null;
    }
    else {
      if (initObj.hasOwnProperty('old_count')) {
        this.old_count = initObj.old_count
      }
      else {
        this.old_count = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResetResponse
    // Serialize message field [old_count]
    bufferOffset = _serializer.int64(obj.old_count, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResetResponse
    let len;
    let data = new ResetResponse(null);
    // Deserialize message field [old_count]
    data.old_count = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'solver/ResetResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50d829b83cc38d4dc3e877a949af2705';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 old_count
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResetResponse(null);
    if (msg.old_count !== undefined) {
      resolved.old_count = msg.old_count;
    }
    else {
      resolved.old_count = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: ResetRequest,
  Response: ResetResponse,
  md5sum() { return 'b60021db68ddc3303a9e21fb2914173c'; },
  datatype() { return 'solver/Reset'; }
};
