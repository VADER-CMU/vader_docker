FROM osrf/ros:noetic-desktop-full
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

RUN echo "alias sb='source devel/setup.bash'" >> ~/.bashrc
RUN echo "alias cm='catkin_make'" >> ~/.bashrc
RUN echo "alias rd='rosdep install --from-paths src -y --ignore-src'" >> ~/.bashrc
# General packages
RUN apt update && apt install python3-rosdep git python3-pip python3-catkin-tools -y
RUN pip install numpy scipy 
# Planning packages
RUN apt install ros-noetic-combined-robot-hw nano ros-noetic-moveit ros-noetic-ros-controllers ros-noetic-ros-control ros-noetic-moveit-chomp-optimizer-adapter ros-noetic-moveit-visual-tools -y 
RUN pip install pyyaml dynamixel_sdk

# Sim
RUN apt install ros-noetic-joint-trajectory-controller -y
#ROSDEP
RUN rosdep update 
