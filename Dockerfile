FROM ubuntu:latest

# prevent time zone config. asking questions
ARG DEBIAN_FRONTEND=noninteractive

ARG USER_ID
ARG GROUP_ID
ARG USERNAME
ARG GROUPNAME
ARG PASSWORD

# -l in useradd needed to avoid some large sparse log file
# https://github.com/moby/moby/issues/5419
RUN apt-get update \
 && apt-get install -y git mc aptitude tig pgadmin4 xterm lynx \
                       iproute2 openssh-server \
&&  groupadd -g $GROUP_ID $GROUPNAME \
&&  useradd -l -u $USER_ID -g $GROUPNAME -m $USERNAME \
&&  echo $USERNAME:$PASSWORD | chpasswd

# run in non-daemon mode
CMD ["sshd", "-D"]

