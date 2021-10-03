FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV USER=googledrive
RUN apt update
RUN apt -y install software-properties-common gpg gnupg-agent firefox xterm
RUN add-apt-repository ppa:alessandro-strada/ppa
RUN apt-get update && apt-get -y install google-drive-ocamlfuse \
 && rm -rf /var/lib/apt/lists/*
RUN sed -i '/user_allow_other/s/^#//' /etc/fuse.conf
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
