FROM ubuntu:18.04

MAINTAINER Vinay Patil <vinay.hpatil@gmail.com>

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker # Creates api text box
# FROM ubuntu:18.04
 #RUN apt-get update
 RUN apt-get install -y tar cmake make git ssh wget openssh-server curl sudo
# #WORKDIR /home
 RUN mkdir /root/.ssh
 RUN ssh-keyscan -t rsa gitlab.com >> /root/.ssh/known_hosts
 RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts
 RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# RUN chmod +x /usr/local/bin/docker-compose
 RUN apt-get install -y apt-transport-https ca-certificates software-properties-common
 RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
 RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
 RUN apt-get install --yes nodejs mocha chai

#RUN sudo wrapdocker
# CMD ["/bin/bash","wrapdocker"]
# CMD ["/bin/bash", "-c", "while true; do sleep 30; done;"]
