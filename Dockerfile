FROM ubuntu:vivid

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
  apt-transport-https \
  ca-certificates \
  man \
  sudo \
  git \
  tmux \
  curl \
  wget \
  bash-completion \
  mr \
  lxc \
  iptables \
  sqlite3

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

ENV DEBIAN_FRONTEND dialog

RUN mkdir /opt/python
WORKDIR /opt/python
RUN wget --no-check-certificate  https://downloads.egenix.com/python/install-pyrun
RUN chmod +x install-pyrun 
ENV PLATFORM linux-x86_64
RUN ./install-pyrun --log --platform=linux-x86_64 --disable-certificate-checks ./

ENV PATH /opt/python/bin:$PATH

RUN pip install -U docker-compose

RUN curl -sL https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker
RUN curl -sL https://raw.githubusercontent.com/docker/compose/1.2.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
#RUN ln -s /opt/python/bin/python /usr/bin/
RUN ln -s /opt/python/bin/docker-compose /usr/local/bin/

COPY .tmux.conf /root/.tmux.conf
COPY .init.sh /root/.init.sh
RUN chmod +x /root/.init.sh

WORKDIR /root

CMD /root/.init.sh
