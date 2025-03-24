FROM osrf/ros:noetic-desktop-full
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

RUN echo "alias sb='source devel/setup.bash'" >> ~/.bashrc
RUN echo "alias cm='catkin_make'" >> ~/.bashrc
# General packages
RUN apt update && apt install python3-rosdep git python3-pip python3-catkin-tools -y
RUN pip install numpy scipy 
# Planning packages
RUN apt install nano ros-noetic-moveit -y 
RUN pip install pyyaml dynamixel_sdk
# Sim
RUN apt install ros-noetic-ros-ign-gazebo -y
#ROSDEP
RUN rosdep update 