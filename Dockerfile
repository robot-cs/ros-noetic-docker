
FROM osrf/ros:noetic-desktop-full

# Ignore keybourd layout seting
ARG DEBIAN_FRONTEND=noninteractive

# set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update \
    && apt-get install -y tzdata
RUN date

# Install apt packages
RUN apt-get update && apt-get install -y \
    git \
    nano \
    wget \
    curl \
    terminator \
    usbutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install ROS packages
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-catkin-tools \
    ros-noetic-joy ros-noetic-teleop-twist-joy \
    ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
    ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
    ros-noetic-rosserial-python ros-noetic-rosserial-client \
    ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
    ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
    ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
    ros-noetic-interactive-markers \
    ros-noetic-dynamixel-sdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create ROS workspace
RUN mkdir -p /mypro/catkin_ws/src
RUN cd /mypro/catkin_ws && /bin/bash -c "source /opt/ros/noetic/setup.sh; catkin_make"

RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "source /mypro/catkin_ws/devel/setup.bash" >> /root/.bashrc
RUN echo "export ROS_MASTER_URI=http://localhost:11311" >> /root/.bashrc
RUN echo "export ROS_HOSTNAME=localhost" >> /root/.bashrc

# Install other packages
RUN apt-get update&& apt-get install -y \
    x11-apps

