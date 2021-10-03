#!/bin/bash
getent passwd "$USER" >/dev/null || useradd "$USER" --uid ${UID:-1000} -s /bin/bash
#Copy skeleton files and set proper permissions
/sbin/mkhomedir_helper "${USER}" 027
chown "$USER" -R /home/"${USER}"
#Run under created user
chown $USER:$USER /tmp/.docker.xauth
su - "$USER" -c "DISPLAY=$DISPLAY google-drive-ocamlfuse; google-drive-ocamlfuse -o allow_other /home/$USER/googledrive/; sleep inf" 
