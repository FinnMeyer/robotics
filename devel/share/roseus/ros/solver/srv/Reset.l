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
  :slots (_new_count ))

(defmethod solver::ResetRequest
  (:init
   (&key
    ((:new_count __new_count) 0)
    )
   (send-super :init)
   (setq _new_count (round __new_count))
   self)
  (:new_count
   (&optional __new_count)
   (if __new_count (setq _new_count __new_count)) _new_count)
  (:serialization-length
   ()
   (+
    ;; int64 _new_count
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _new_count
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _new_count (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _new_count) (= (length (_new_count . bv)) 2)) ;; bignum
              (write-long (ash (elt (_new_count . bv) 0) 0) s)
              (write-long (ash (elt (_new_count . bv) 1) -1) s))
             ((and (class _new_count) (= (length (_new_count . bv)) 1)) ;; big1
              (write-long (elt (_new_count . bv) 0) s)
              (write-long (if (>= _new_count 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _new_count s)(write-long (if (>= _new_count 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _new_count
#+(or :alpha :irix6 :x86_64)
      (setf _new_count (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _new_count (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass solver::ResetResponse
  :super ros::object
  :slots (_old_count ))

(defmethod solver::ResetResponse
  (:init
   (&key
    ((:old_count __old_count) 0)
    )
   (send-super :init)
   (setq _old_count (round __old_count))
   self)
  (:old_count
   (&optional __old_count)
   (if __old_count (setq _old_count __old_count)) _old_count)
  (:serialization-length
   ()
   (+
    ;; int64 _old_count
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _old_count
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _old_count (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _old_count) (= (length (_old_count . bv)) 2)) ;; bignum
              (write-long (ash (elt (_old_count . bv) 0) 0) s)
              (write-long (ash (elt (_old_count . bv) 1) -1) s))
             ((and (class _old_count) (= (length (_old_count . bv)) 1)) ;; big1
              (write-long (elt (_old_count . bv) 0) s)
              (write-long (if (>= _old_count 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _old_count s)(write-long (if (>= _old_count 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _old_count
#+(or :alpha :irix6 :x86_64)
      (setf _old_count (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _old_count (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass solver::Reset
  :super ros::object
  :slots ())

(setf (get solver::Reset :md5sum-) "b60021db68ddc3303a9e21fb2914173c")
(setf (get solver::Reset :datatype-) "solver/Reset")
(setf (get solver::Reset :request) solver::ResetRequest)
(setf (get solver::Reset :response) solver::ResetResponse)

(defmethod solver::ResetRequest
  (:response () (instance solver::ResetResponse :init)))

(setf (get solver::ResetRequest :md5sum-) "b60021db68ddc3303a9e21fb2914173c")
(setf (get solver::ResetRequest :datatype-) "solver/ResetRequest")
(setf (get solver::ResetRequest :definition-)
      "int64 new_count
---
int64 old_count
")

(setf (get solver::ResetResponse :md5sum-) "b60021db68ddc3303a9e21fb2914173c")
(setf (get solver::ResetResponse :datatype-) "solver/ResetResponse")
(setf (get solver::ResetResponse :definition-)
      "int64 new_count
---
int64 old_count
")



(provide :solver/Reset "b60021db68ddc3303a9e21fb2914173c")


