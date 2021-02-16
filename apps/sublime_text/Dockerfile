FROM appbox

RUN apt-get update \
 && apt-get install -y apt-transport-https ca-certificates curl software-properties-common \
 && curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - \
 && add-apt-repository "deb https://download.sublimetext.com/ apt/stable/" \
 && apt-get update \
 && apt-get install -y sublime-text
