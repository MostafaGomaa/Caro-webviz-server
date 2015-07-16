##This Scrpit launches 3 servers on the same computer to be run with along side the Gazebo simulation. 
##Each server consists of a ROSBRIDGE instances on diffent port for each of the agent's RosCore, and a tf2_wed_republisher.


OPEN_COMMAND="gnome-terminal"


#Launch the Rosbridge and Tf2_web_republisher instace for each ros core 
OPEN_COMMAND="$OPEN_COMMAND --tab -t R1_rosbridge -e 'bash -c \"export ROS_MASTER_URI=http://localhost:11311; rosparam set /rosbridge/port 9090; rosrun rosbridge_server rosbridge.py; exec bash\"'"
OPEN_COMMAND="$OPEN_COMMAND --tab -t R2_rosbridge -e 'bash -c \"export ROS_MASTER_URI=http://localhost:11312; rosparam set /rosbridge/port 8080; rosrun rosbridge_server rosbridge.py; exec bash\"'"
OPEN_COMMAND="$OPEN_COMMAND --tab -t R3_rosbridge -e 'bash -c \"export ROS_MASTER_URI=http://localhost:11313; rosparam set /rosbridge/port 7070; rosrun rosbridge_server rosbridge.py; exec bash\"'"

OPEN_COMMAND="$OPEN_COMMAND --tab -t R1_tf2 -e 'bash -c \"export ROS_MASTER_URI=http://localhost:11311; rosrun tf2_web_republisher tf2_web_republisher; exec bash\"'"
OPEN_COMMAND="$OPEN_COMMAND --tab -t R2_tf2 -e 'bash -c \"export ROS_MASTER_URI=http://localhost:11312; rosrun tf2_web_republisher tf2_web_republisher; exec bash\"'"
OPEN_COMMAND="$OPEN_COMMAND --tab -t R3_tf2 -e 'bash -c \"export ROS_MASTER_URI=http://localhost:11313; rosrun tf2_web_republisher tf2_web_republisher; exec bash\"'"

 

eval $OPEN_COMMAND

