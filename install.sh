#!/bin/bash
echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
apt-get update
apt get -y upgrade
apt-get -y install ubuntu-desktop gnome libssl0.9.8
apt-get --fix-missing install -y ros-jade-desktop-full libopencv-dev ros-jade-gmapping ros-jade-turtle-tf ros-jade-navigation ros-jade-find-object-2d ros-jade-frontier-exploration

rosdep init
su student -c 'rosdep update'

echo "source /opt/ros/jade/setup.bash" >> /etc/bash.bashrc

echo 'export ROS_IP=$(ifconfig eth | sed -n '\''s/.*inet addr:\([0-9.]\+\)\s.*/\1/p'\'')' >> /etc/bash.bashrc
echo 'export ROS_MASTER_URI=http://$(ifconfig eth | sed -n '\''s/.*inet addr:\([0-9.]\+\)\s.*/\1/p'\''):11311' >> /etc/bash.bashrc

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
rospack find find_object_2d
rospack find usb_cam
rospack find frontier_exploration

wget wget http://coppeliarobotics.com/files/V-REP_PRO_EDU_V3_3_2_64_Linux.tar.gz
tar -zxvf V-REP_PRO_EDU_V3_3_2_64_Linux.tar.gz

rm -rf /usr/share/vrep
mv V-REP_PRO_EDU_V3_3_2_64_Linux /usr/share/vrep
rm V-REP_PRO_EDU_V3_3_2_64_Linux.tar.gz
rm /usr/bin/vrep
ln -s /usr/share/vrep/vrep.sh /usr/bin/vrep

export VREP_ROOT=/usr/share/vrep
cd /usr/share/vrep/programming/ros_packages
mkdir catkin_vrep
cd catkin_vrep/
mkdir src
cd src
catkin_init_workspace
cd ..
cp -avr ../vrep_common/ src/vrep_common
cp -avr ../vrep_plugin/ src/vrep_plugin
cp -avr ../vrep_plugin_skeleton/ src/vrep_plugin_skeleton
cp -avr ../vrep_skeleton_msg_and_srv/ src/vrep_skeleton_msg_and_srv
source /opt/ros/jade/setup.bash
catkin_make

cp -v /usr/share/vrep/programming/ros_packages/catkin_vrep/devel/lib/libv_repExtRos.so /usr/share/vrep/libv_repExtRos.so
chmod -R a+x /usr/share/vrep/*