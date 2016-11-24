#!/bin/bash

sudo apt-get install ros-jade-gmapping ros-jade-turtle-tf ros-jade-navigation

rospack find gmapping
rospack find amcl
rospack find carrot_planner
rospack find dwa_local_planner
rospack find move_base
rospack find nav_core
rospack find robot_pose_ekf
rospack find base_local_planner
rospack find clear_costmap_recovery
rospack find fake_localization
rospack find global_planner
rospack find move_base_msgs
rospack find navfn
rospack find rotate_recovery
rospack find costmap_2d
rospack find map_server
rospack find move_slow_and_clear
rospack find voxel_grid