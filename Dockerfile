# vim:set ft=dockerfile:
FROM debian:testing-slim

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV TERM screen-256color

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get -yqq install tzdata locales weechat \
&& echo "Europe/Barcelona" > /etc/timezone \
&& dpkg-reconfigure -f noninteractive tzdata \
&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
&& sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen \
&& echo 'LANG="en_US.UTF-8"'>/etc/default/locale \
&& dpkg-reconfigure --frontend=noninteractive locales \
&& update-locale LANG=en_US.UTF-8 \
&& apt-get clean all && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man* /tmp/* /var/tmp/*

ADD docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 9001

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["weechat"]

