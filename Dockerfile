FROM php:5.6

MAINTAINER Michael Traeger

# install packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    pandoc \
    curl \
    git \
    zip unzip

COPY ./mediawiki-to-markdown-master/ /opt/converter/

WORKDIR /opt/converter/

RUN curl -sS https://getcomposer.org/installer | php

RUN php composer.phar install

#RUN mkdir -p /opt/output

CMD php convert.php --filename=/opt/input.xml --output=/opt/output
