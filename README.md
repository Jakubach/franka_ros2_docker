# franka_ros2_docker

# For Windows:

## Installation:

#### Install Xlaunch Server for displaying GUI:

https://sourceforge.net/projects/vcxsrv/

#### Install Docker Desktop:

https://www.docker.com/products/docker-desktop/

After running Docker Desktop install WSL2 addition (there will be a pop-up window).

#### In a directory with DockerFile build a docker image:

```docker build -t ros2_foxy .```

## Running:

#### Run Xlaunch Server and setup a display with port 0. Then run docker image:

```docker run -e DISPLAY=host.docker.internal:0.0 -it ros2_foxy```
