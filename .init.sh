#set -x

# Create docker goup with same gid as host so we don't need to use sudo for docker
groupadd --gid `stat -c "%g" /var/run/docker.sock` docker

# Add username passed with '-e USER' on docker run and assign docker secondary group
[ -n "${UID}" ] && SET_UID="-u ${UID}" || SET_UID=""
useradd ${SET_UID} -G sudo,docker ${USER}

# Add NOPASSWD to sudo group
sed -i 's/^%sudo.*$/%sudo  ALL=(ALL) NOPASSWD:ALL/' /etc/sudoers

# Create user's home if it doesn't exist (e.g. volume not mounted from host)
[ -d /home/${USER} ] || mkdir /home/${USER}

# Copy over default confs unless they are already present.
for file_name in .profile .bashrc .tmux.conf; do
  if [ ! -f /home/${USER}/${file_name} ]
  then
    cp ${file_name} /home/${USER}
    chown -R ${USER}:${USER} /home/${USER}/${file_name}
  fi
done

su - ${USER}
