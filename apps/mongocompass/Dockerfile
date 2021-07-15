# not without 3 year old docker
# ARG USERNAME
# FROM ${USERNAME}_appbox
FROM tbrown02_appbox

# prevent time zone config. asking questions
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app
# requirements
RUN apt-get update \
 && apt-get install -y libgtk2.0-0 libnotify4 libnss3 xdg-utils libgconf-2-4 \
            libxss1 gvfs-bin libsecret-1-0 gnome-keyring \
 && wget https://downloads.mongodb.com/compass/mongodb-compass_1.28.1_amd64.deb \
 && dpkg --install mongodb-compass_1.28.1_amd64.deb \
 && rm mongodb-compass_1.28.1_amd64.deb

