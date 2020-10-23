FROM ubuntu:latest

# prevent time zone config. asking questions
ARG DEBIAN_FRONTEND=noninteractive

ARG USER_ID
ARG GROUP_ID
ARG USERNAME
ARG GROUPNAME
ARG PASSWORD

 #    apt-get update \
 # && apt-get install -y git mc aptitude tig pgadmin4 xterm lynx \
 #                       iproute2 openssh-server \
RUN  groupadd -g $GROUP_ID $GROUPNAME 
RUN  useradd -u $USER_ID -g $GROUPNAME -m $USERNAME 
RUN  echo $USERNAME:$PASSWORD | chpasswd

# RUN echo "mkdir /run/sshd" > /etc/rc.local \
#  && echo "/usr/sbin/sshd" >> /etc/rc.local \
#  && chmod +x /etc/rc.local 
#  && useradd $USERNAME \
#  && echo "$USERNAME:fred" | chpasswd


# WORKDIR /home/$USERNAME
# RUN chown -R $USER_ID:$GROUP_ID /home/$USERNAME 
# RUN echo "$USERNAME:x:$USER_ID:$GROUP_ID:$USERNAME:/home/$USERNAME:/bin/bash" >> /etc/passwd \
#  && echo "$USERNAME:x:$GROUP_ID:" >> /etc/group \
#  && echo $USERNAME:$PASSWORD | chpasswd
# USER $USER_ID:$GROUP_ID
ENV HOME=/home/$USERNAME
ENV USERNAME=$USERNAME
ENV EDITOR=vim
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

