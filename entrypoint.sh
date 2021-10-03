#!/bin/bash
#Create $USER if not exists user with $UID uid to be volume the same uid as user running this script
getent passwd "$USER" >/dev/null || useradd "$USER" --uid ${UID:-1000} -s /bin/bash
#Copy skeleton files and set proper permissions
/sbin/mkhomedir_helper "${USER}" 027
chown "$USER" -R /home/"${USER}"
#Run under created user google-drive-ocamlfuse twice
su - "$USER" -c "DISPLAY=$DISPLAY google-drive-ocamlfuse; google-drive-ocamlfuse -o allow_other /home/$USER/googledrive/; sleep inf" 
