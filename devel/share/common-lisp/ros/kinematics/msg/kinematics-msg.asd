
(cl:in-package :asdf)

(defsystem "kinematics-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "wheels_rpm" :depends-on ("_package_wheels_rpm"))
    (:file "_package_wheels_rpm" :depends-on ("_package"))
  ))