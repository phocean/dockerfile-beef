FROM phocean/msf

MAINTAINER Phocean <jc@phocean.net>

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /opt

# Base packages
RUN apt-get update && apt-get -y install git bundler nodejs \
    zlib1g-dev libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    locale-gen en_US.UTF-8 && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale  && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    git clone git://github.com/beefproject/beef.git && \
    cd beef && \
    bundle install

ADD config.yaml beef/config.yaml

EXPOSE 3000

WORKDIR /opt/beef

CMD ./beef
