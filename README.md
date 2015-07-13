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

### Run:
* run the rosbrigde and the tf2_web_republisher
```
rosrun rosbridge_server rosbridge.py 
rosrun tf2_web_republisher tf2_web_republisher
```

