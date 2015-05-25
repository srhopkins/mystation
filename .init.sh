# Create docker goup with same gid as host so we don't need to use sudo for docker
groupadd --gid `stat -c "%g" /var/run/docker.sock` docker
# Add username passed with '-e USER' on docker run and assign docker secondary group
useradd -G sudo,docker ${USER}

# Add NOPASSWD to sudo group
sed -i 's/^%sudo.*$/%sudo  ALL=(ALL) NOPASSWD:ALL/' /etc/sudoers

# Create user's home
mkdir /home/${USER}
cp .profile .bashrc /home/${USER}
chown -R ${USER}:${USER} /home/${USER}

su - ${USER} 
