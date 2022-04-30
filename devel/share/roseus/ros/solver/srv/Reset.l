;; Auto-generated. Do not edit!


(when (boundp 'solver::Reset)
  (if (not (find-package "SOLVER"))
    (make-package "SOLVER"))
  (shadow 'Reset (find-package "SOLVER")))
(unless (find-package "SOLVER::RESET")
  (make-package "SOLVER::RESET"))
(unless (find-package "SOLVER::RESETREQUEST")
  (make-package "SOLVER::RESETREQUEST"))
(unless (find-package "SOLVER::RESETRESPONSE")
  (make-package "SOLVER::RESETRESPONSE"))

(in-package "ROS")





(defclass solver::ResetRequest
  :super ros::object
  :slots (_x _y _yaw ))

(defmethod solver::ResetRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _yaw (float __yaw))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass solver::ResetResponse
  :super ros::object
  :slots (_old_x _old_y _old_yaw ))

(defmethod solver::ResetResponse
  (:init
   (&key
    ((:old_x __old_x) 0.0)
    ((:old_y __old_y) 0.0)
    ((:old_yaw __old_yaw) 0.0)
    )
   (send-super :init)
   (setq _old_x (float __old_x))
   (setq _old_y (float __old_y))
   (setq _old_yaw (float __old_yaw))
   self)
  (:old_x
   (&optional __old_x)
   (if __old_x (setq _old_x __old_x)) _old_x)
  (:old_y
   (&optional __old_y)
   (if __old_y (setq _old_y __old_y)) _old_y)
  (:old_yaw
   (&optional __old_yaw)
   (if __old_yaw (setq _old_yaw __old_yaw)) _old_yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _old_x
    4
    ;; float32 _old_y
    4
    ;; float32 _old_yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _old_x
       (sys::poke _old_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _old_y
       (sys::poke _old_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _old_yaw
       (sys::poke _old_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _old_x
     (setq _old_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _old_y
     (setq _old_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _old_yaw
     (setq _old_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass solver::Reset
  :super ros::object
  :slots ())

(setf (get solver::Reset :md5sum-) "1d0483a5373f8cadf48c1a80ae178886")
(setf (get solver::Reset :datatype-) "solver/Reset")
(setf (get solver::Reset :request) solver::ResetRequest)
(setf (get solver::Reset :response) solver::ResetResponse)

(defmethod solver::ResetRequest
  (:response () (instance solver::ResetResponse :init)))

(setf (get solver::ResetRequest :md5sum-) "1d0483a5373f8cadf48c1a80ae178886")
(setf (get solver::ResetRequest :datatype-) "solver/ResetRequest")
(setf (get solver::ResetRequest :definition-)
      "float32 x
float32 y
float32 yaw
---
float32 old_x
float32 old_y
float32 old_yaw
")

(setf (get solver::ResetResponse :md5sum-) "1d0483a5373f8cadf48c1a80ae178886")
(setf (get solver::ResetResponse :datatype-) "solver/ResetResponse")
(setf (get solver::ResetResponse :definition-)
      "float32 x
float32 y
float32 yaw
---
float32 old_x
float32 old_y
float32 old_yaw
")



(provide :solver/Reset "1d0483a5373f8cadf48c1a80ae178886")


