FROM ubuntu:vivid

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
  git \
  tmux \
  curl \
  wget \
  sqlite3

ENV DEBIAN_FRONTEND dialog

RUN mkdir /opt/python
WORKDIR /opt/python
RUN wget --no-check-certificate  https://downloads.egenix.com/python/install-pyrun
RUN chmod +x install-pyrun 
ENV PLATFORM linux-x86_64
RUN ./install-pyrun --log --platform=linux-x86_64 --disable-certificate-checks ./

ENV PATH /opt/python/bin:$PATH

RUN pip install -U docker-compose

COPY .tmux.conf /root/.tmux.conf

WORKDIR /root

CMD /bin/bash
