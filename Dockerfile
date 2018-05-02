FROM ubuntu:xenial AS base

RUN apt-get update && apt-get install -y \
  sudo \
  git \
  gnupg2 \
  curl \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Install yarn for building lando
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install yarn -y

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN sudo apt-get update && sudo apt-get install -y docker-ce

# Install Lando
RUN curl -sLO https://github.com/lando/lando/releases/download/v3.0.0-beta.43/lando-v3.0.0-beta.43.deb \
  && sudo dpkg -i lando-v3.0.0-beta.43.deb

RUN lando version