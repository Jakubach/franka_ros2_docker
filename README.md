# Running ROS2 with GUI on Docker with [franka_ros2](https://github.com/frankaemika/franka_ros2) package.

## Installation (on Windows and Linux):

#### Install Xlaunch Server for displaying GUI:

https://sourceforge.net/projects/vcxsrv/

#### Install Docker Desktop:

https://www.docker.com/products/docker-desktop/

After running Docker Desktop install WSL2 addition (there will be a pop-up window).

#### In a directory with DockerFile build a docker image:

```docker build -t ros2_foxy .```

## Running on Windows:

#### Run Xlaunch Server and setup a display with port 0. Then run docker image:

```docker run -e DISPLAY=host.docker.internal:0.0 -it ros2_foxy```

## Running on Linux:


#### Allow for connections for GUI

```xhost +``` 

#### Run docker image with command:

```docker run --net=host --cap-add SYS_NICE -e DISPLAY=$DISPLAY -v /tmp/.X11-unix -it ros2_foxy```
