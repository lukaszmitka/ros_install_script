# About
This script was prepared to automate ROS and V-REP installation process on computers used during Service Robots classes.
It install ROS Jade, V-REP 3.3.2, compile V-REP plugin for ROS and configure neccesary environment variables.
Script was tested on Ubuntu 14.04 only.

## How to use
In terminal type:

```
$ sudo ./install.sh
```

Then wait for script to finish.
Now you can use ROS and V-REP with ros plugin.

To run V-REP type
```
$ vrep
```
More info about V-REP usage can be found in [documentation](http://www.coppeliarobotics.com/helpFiles/)

To run ROS type
```
$ roscore
```
More info about ROS usage can be found in [documentation](http://www.coppeliarobotics.com/helpFiles/)
