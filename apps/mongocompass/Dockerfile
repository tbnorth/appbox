ARG USERNAME
FROM ${USERNAME}_appbox

# NOTE:  *** IMPORTANT *** compassbox needs to be built on a 20.04 based image

# prevent time zone config. asking questions
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /app
# requirements
RUN apt-get update \
 && apt-get install -y libgtk2.0-0 libnotify4 libnss3 xdg-utils libgconf-2-4 \
            libxss1 libsecret-1-0 gnome-keyring \
 && wget -O mongo.deb https://downloads.mongodb.com/compass/mongodb-compass_1.38.2_amd64.deb \
 && dpkg --install mongo.deb \
 && rm mongo.deb

