#set -x

# Add username passed with '-e USER' on docker run and assign docker secondary group.
# If UID env var is present set uid to that. If username is "docker" skip group creation.
[ -n "${UID}" ] && ARGS="-u ${UID}" || ARGS=""
[ "${USER}" = "docker" ] && ARGS="${ARGS} --no-user-group" 
useradd ${ARGS} -G sudo,docker ${USER}

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

service docker start

su - ${USER}
