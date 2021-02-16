FROM ${USERNAME}_appbox

WORKDIR /postman

RUN wget -Opostman.tar.gz https://dl.pstmn.io/download/latest/linux64 \
 && tar xaf postman.tar.gz \
 && rm postman.tar.gz \
 && apt-get install -y libxcursor1 libnss3-dev \
    libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev libasound2-dev

