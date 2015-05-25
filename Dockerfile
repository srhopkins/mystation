FROM ubuntu:vivid

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
  man \
  sudo \
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

RUN ln -s /opt/python/bin/python /usr/bin/
RUN ln -s /opt/python/bin/docker-compose /usr/local/bin/

COPY .tmux.conf /root/.tmux.conf
COPY .init.sh /root/.init.sh
RUN chmod +x /root/.init.sh

WORKDIR /root

CMD /root/.init.sh
