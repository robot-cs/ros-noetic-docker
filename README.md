# ros-noetic-wslg

This is a template for using WSLg (Windows Subsystem for Linux GUI) on Docker Container (Ubuntu 20.04, ros noetic).  

If you want to use GPU together, use the following template.  
[0V/gpu-wslg](https://github.com/0V/gpu-wslg)

## Require

- Windows 11
- WSL2 (latest)
- Docker Desktop 
  - docker
  - docker-compose

## Installation

```
docker-compose build
docker-compose run ros-noetic-wslg bash
```

## Try!

You can use the following commands to test WSLg on Docker Container.

```
apt install -y x11-apps
xeyes
```

### result
![image](https://user-images.githubusercontent.com/7000978/152202881-6c295dc5-977f-4826-91b6-875d76bcd2e1.png)
