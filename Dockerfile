FROM jenkins/jenkins:lts
MAINTAINER haditya1010-dev

USER root

# Install the latest Docker CE binaries and add user `jenkins` to the docker group
RUN apt-get update -qq && \
    apt-get install --qqy apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
   apt-get update -qq && \
   apt-get -y install docker-ce && \
   apt-get clean && \
   usermod -aG docker jenkins

USER jenkins
