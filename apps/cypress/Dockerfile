# not without 3 year old docker
# ARG USERNAME
# FROM ${USERNAME}_appbox
FROM seqacyp_base

# prevent time zone config. asking questions
ARG DEBIAN_FRONTEND=noninteractive

# Cypress requirements
RUN apt-get update \
 && apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev \
            libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 \
            xauth xvfb curl gnupg

ARG NODE_MAJOR=20

RUN mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
    | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] \
    https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" \
    > /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install -y nodejs \
 && node -v \
 && node -v | grep v20

WORKDIR /app

ARG USERNAME
ARG GROUPNAME

RUN chown $USERNAME.$GROUPNAME /app \
 && apt-get install -y gnupg \
# apparently apt-get install yarn installs something else by default
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg \
    | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" \
    | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install -y yarn

# RUN npm install -g yarn

USER $USERNAME

RUN cd /home/$USERNAME \
 && yarn add cypress@12.10 --dev --ignore-engines \
 && yarn run cypress verify \
 && yarn add --dev mochawesome mochawesome-merge mochawesome-report-generator

# needed for entrypoint
USER root

