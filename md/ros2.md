```bash
conda create -n ros_env python=3.11
conda activate ros_env

# this adds the conda-forge channel to the new created environment configuration
conda config --env --add channels conda-forge
# and the robostack channel
conda config --env --add channels robostack-staging
# remove the defaults channel just in case, this might return an error if it is not in the list which is ok
conda config --env --remove channels defaults


# Install ros-humble into the environment (ROS2)
conda install ros-humble-desktop
conda deactivate
conda activate ros_env
```



```bash
# Conda aliases
alias ca='conda activate'
alias cda='conda deactivate'
alias cl='conda list'
alias ce='conda env list'

# ROS2 aliases
alias ros2s='source /opt/ros/foxy/setup.bash'  # Replace 'foxy' with your ROS2 distro
alias rb='ros2 bag'
alias rn='ros2 node'
alias rt='ros2 topic'
alias rs='ros2 service'
alias rp='ros2 param'
alias rl='ros2 launch'

# Combined Conda and ROS2 aliases
alias car='conda activate ros_env && source ~/ros2_ws/install/setup.zsh && source ~/miniconda3/envs/ros_env/share/ros2cli/environment/ros2-argcomplete.zsh'  # Activate conda env and source ROS2
alias cdr='conda deactivate'  # Deactivate conda env and source ROS2
```



## this is going to happen
[setuptools issue](https://github.com/RoboStack/ros-humble/issues/162)


[home](../index.html)
