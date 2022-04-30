; Auto-generated. Do not edit!


(cl:in-package solver-srv)


;//! \htmlinclude Reset-request.msg.html

(cl:defclass <Reset-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass Reset-request (<Reset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name solver-srv:<Reset-request> is deprecated: use solver-srv:Reset-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Reset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader solver-srv:x-val is deprecated.  Use solver-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Reset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader solver-srv:y-val is deprecated.  Use solver-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <Reset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader solver-srv:yaw-val is deprecated.  Use solver-srv:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reset-request>) ostream)
  "Serializes a message object of type '<Reset-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reset-request>) istream)
  "Deserializes a message object of type '<Reset-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reset-request>)))
  "Returns string type for a service object of type '<Reset-request>"
  "solver/ResetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset-request)))
  "Returns string type for a service object of type 'Reset-request"
  "solver/ResetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reset-request>)))
  "Returns md5sum for a message object of type '<Reset-request>"
  "1d0483a5373f8cadf48c1a80ae178886")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reset-request)))
  "Returns md5sum for a message object of type 'Reset-request"
  "1d0483a5373f8cadf48c1a80ae178886")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reset-request>)))
  "Returns full string definition for message of type '<Reset-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reset-request)))
  "Returns full string definition for message of type 'Reset-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reset-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Reset-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':yaw (yaw msg))
))
;//! \htmlinclude Reset-response.msg.html

(cl:defclass <Reset-response> (roslisp-msg-protocol:ros-message)
  ((old_x
    :reader old_x
    :initarg :old_x
    :type cl:float
    :initform 0.0)
   (old_y
    :reader old_y
    :initarg :old_y
    :type cl:float
    :initform 0.0)
   (old_yaw
    :reader old_yaw
    :initarg :old_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass Reset-response (<Reset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name solver-srv:<Reset-response> is deprecated: use solver-srv:Reset-response instead.")))

(cl:ensure-generic-function 'old_x-val :lambda-list '(m))
(cl:defmethod old_x-val ((m <Reset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader solver-srv:old_x-val is deprecated.  Use solver-srv:old_x instead.")
  (old_x m))

(cl:ensure-generic-function 'old_y-val :lambda-list '(m))
(cl:defmethod old_y-val ((m <Reset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader solver-srv:old_y-val is deprecated.  Use solver-srv:old_y instead.")
  (old_y m))

(cl:ensure-generic-function 'old_yaw-val :lambda-list '(m))
(cl:defmethod old_yaw-val ((m <Reset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader solver-srv:old_yaw-val is deprecated.  Use solver-srv:old_yaw instead.")
  (old_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reset-response>) ostream)
  "Serializes a message object of type '<Reset-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'old_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'old_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'old_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reset-response>) istream)
  "Deserializes a message object of type '<Reset-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reset-response>)))
  "Returns string type for a service object of type '<Reset-response>"
  "solver/ResetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset-response)))
  "Returns string type for a service object of type 'Reset-response"
  "solver/ResetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reset-response>)))
  "Returns md5sum for a message object of type '<Reset-response>"
  "1d0483a5373f8cadf48c1a80ae178886")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reset-response)))
  "Returns md5sum for a message object of type 'Reset-response"
  "1d0483a5373f8cadf48c1a80ae178886")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reset-response>)))
  "Returns full string definition for message of type '<Reset-response>"
  (cl:format cl:nil "float32 old_x~%float32 old_y~%float32 old_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reset-response)))
  "Returns full string definition for message of type 'Reset-response"
  (cl:format cl:nil "float32 old_x~%float32 old_y~%float32 old_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reset-response>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Reset-response
    (cl:cons ':old_x (old_x msg))
    (cl:cons ':old_y (old_y msg))
    (cl:cons ':old_yaw (old_yaw msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Reset)))
  'Reset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Reset)))
  'Reset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset)))
  "Returns string type for a service object of type '<Reset>"
  "solver/Reset")