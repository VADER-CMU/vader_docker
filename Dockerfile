FROM osrf/ros:noetic-desktop-full
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

RUN echo "alias sb='source devel/setup.bash'" >> ~/.bashrc
RUN echo "alias cm='catkin_make'" >> ~/.bashrc
RUN echo "alias rd='rosdep install --from-paths src -y --ignore-src'" >> ~/.bashrc
# General packages
RUN apt update && apt install python3-rosdep git python3-pip python3-catkin-tools -y
#RUN pip install numpy scipy 
# Perception packages
RUN apt install ros-noetic-ddynamic-reconfigure ros-noetic-librealsense2 python3-tk -y
RUN pip install opencv-python numpy ultralytics pyrealsense2 matplotlib pillow pyyaml open3d
RUN pip install scipy
#RUN mkdir -p /etc/apt/keyrings
#RUN curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | tee /etc/apt/keyrings/librealsense.pgp > /dev/null
#RUN echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo `lsb_release -cs` main" | tee /etc/apt/sources.list.d/librealsense.list
#RUN apt update
#RUN apt install librealsense2-dkms librealsense2-utils

# Planning packages
RUN apt install ros-noetic-combined-robot-hw nano ros-noetic-moveit ros-noetic-ros-controllers ros-noetic-ros-control ros-noetic-moveit-chomp-optimizer-adapter ros-noetic-moveit-visual-tools ros-noetic-tf2-sensor-msgs -y 
RUN pip install pyyaml dynamixel_sdk

# Sim
RUN apt install ros-noetic-joint-trajectory-controller -y
#ROSDEP
RUN rosdep update 
