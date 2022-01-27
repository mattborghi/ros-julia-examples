# RobotOS.jl examples

# Run

> If the package is not found by doing `rospack find julia_tutorials` after doing a `catkin_make` or `catkin build` probably you need to `source ~/catkin_ws/devel/setup.bash`.

Go to `cd ~/catkin_ws/src` and clone the repository `git clone https://github.com/mattborghi/ros-julia-examples.git` or `gh repo clone mattborghi/ros-julia-examples`. Then run `cd ~/catkin_ws/` and `catkin_make`.

Before running an example make sure a `roscore` instance is running.

For some reason it doens't work by running

```shell
rosrun julia_tutorials talker.jl
```

But it works by running

```shell
cd ~/catkin_ws/src/julia_tutorials/
julia --project scripts/talker.jl
```
