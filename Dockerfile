FROM ubuntu:latest AS base

RUN apt-get update && apt-get install -y \
  sudo \
  git \
  gnupg2 \
  curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update && sudo apt-get install yarn -y

RUN git clone https://github.com/lando/lando.git \
  && cd lando \
  && git checkout v3.0.0-beta.42 \
  && yarn \
  && mkdir -p /usr/local/bin \
  && pwd \
  && ln -s /lando/bin/lando.js /usr/bin/lando

RUN lando version
