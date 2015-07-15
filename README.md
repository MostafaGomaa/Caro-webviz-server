# Caro-webviz-server
Packages that needs to be installed on each agent

### Packages
 * [rosbridge_suite](http://wiki.ros.org/rosbridge_suite) is a [ROS meta-package](http://www.ros.org/wiki/catkin/conceptual_overview#Metapackages_and_the_Elimination_of_Stacks) including all the rosbridge packages. Rosbridge provides a JSON API to ROS functionality for non-ROS programs
 
* [tf2_web_republisher](http://wiki.ros.org/tf2_web_republisher) used to throttle and precompute tf transform information to be sent to via the rosbridge_suite to a ros3djs web client. 



###Checkout:
clone using the recursive parameter to get all submodules.Then, Navigate to Rosbridge and checkout 'fuerte-devel' branch
```
git clone https://github.com/MostafaGomaa/Caro-webviz-server --recursive
cd YOUR_PATH/Caro-webviz-server/rosbridge_suite
git checkout fuerte-devel

```

Change the line 33 in ../rosbridge_suite/rosbridge_library/src/rosbridge_library/internal/pngcompression.py
to (from PIL import image).

###Installation:
* Add your directory that contains the packages as a $ROS_PACKAGE_PATH in the .bashrc
```
export ROS_PACKAGE_PATH=(~/YOUR_caro-webviz-server_DIR):$ROS_PACKAGE_PATH
```

* Navigate to the package directory and rosmake each of the packages (here it is ~/Caro-webviz-server)
```
cd ~/Caro-webviz-server/rosbridge_suite
rosmake

cd ~/Caro-webviz-server/tf2_web_republisher
rosmake
```

### Run the server:
####----Case 1: Each agent running on separate PC:
* simplly run an instances of the rosbridege_server and a tf2_web_republisher on each separate agent. Rosbridge_server will launch on port 9090 by default.
```
rosrun rosbridge_server rosbridge.py
```

* Run the tf2_web_republisher on a new terminal
```
rosrun tf2_web_republisher tf2_web_republisher
```


####----Case 2:  All agent running on the same PC:
* Here we run three instances of the rosbridege_server, and a tf2_web_republisher for each. Each rosbridge instance will communicate to a different RosCore that belongs to one of the agents.
We will launch each rosbridge_server instance on a different port to enable the client to make the distinction between the three instances.

/For each instance, open a new terminal window. Set the ROS master corresponding to an agents RosCore URI. Set the port rosparameter you would like to launch this rosbridge instance on. For example:
```
export ROS_MASTER_URI= localhost:11311
rosparam set /rosbridge/port 9090
rosrun rosbridge_server rosbridge.py
```
 
* Run the tf2_web_republisher on a new terminal
```
export ROS_MASTER_URI= localhost:11311
rosrun tf2_web_republisher tf2_web_republisher
```
