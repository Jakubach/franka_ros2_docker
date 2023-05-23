FROM osrf/ros:foxy-desktop

SHELL ["/bin/bash", "-c"] 

RUN apt-get update --fix-missing -y && apt-get install -y --allow-unauthenticated \
    clang-6.0 \
    clang-format-6.0 \
    clang-tidy-6.0 \
    python3-pip \
    libpoco-dev \
    libeigen3-dev \
    ros-foxy-control-msgs \
    ros-foxy-xacro \
    ros-foxy-ament-cmake-clang-format \
    ros-foxy-ament-clang-format \
    ros-foxy-ament-flake8 \
    ros-foxy-ament-cmake-clang-tidy \
    ros-foxy-angles \
    ros-foxy-ros2-control \
    ros-foxy-realtime-tools \
    ros-foxy-control-toolbox \
    libpoco-dev \
    libeigen3-dev \
    build-essential \
    cmake \
    git \
    nano \
    python3-pip


RUN pip3 install --upgrade pip

WORKDIR /home
RUN git clone --recursive https://github.com/frankaemika/libfranka --branch 0.10.0

WORKDIR /home/libfranka
RUN mkdir /home/libfranka/build
WORKDIR /home/libfranka/build

RUN cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF ..
RUN cmake --build .

RUN mkdir -p /home/franka_ros2_ws/src
WORKDIR /home/franka_ros2_ws
RUN git clone https://github.com/frankaemika/franka_ros2.git src/franka_ros2
RUN rosdep install -i --from-path src --rosdistro foxy -y
RUN source /opt/ros/foxy/setup.bash && colcon build --symlink-install
RUN source install/setup.sh