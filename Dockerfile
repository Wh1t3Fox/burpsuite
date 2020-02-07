from ubuntu:bionic

ARG VERSION=2020.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
 apt-get -y upgrade && \
 apt-get install -y \
    locales \
    locales-all \
    openjdk-11-jre \
    openjdk-11-jdk \
    curl \
    ca-certificates \
    --no-install-recommends && \
 rm -fr /var/lib/apt/lists/* && \
 locale-gen en_US.UTF-8 && \
 echo 'LANG=en_US.UTF-8' > /etc/locale.conf && \
 useradd -m -s /bin/bash user

USER user
WORKDIR /home/user

RUN curl -SL -o "burp.jar" "https://portswigger.net/burp/releases/download\?product\=community\&version\=${VERSION}\&type\=Jar"

ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

CMD ["java", "-jar", "burp.jar"]
