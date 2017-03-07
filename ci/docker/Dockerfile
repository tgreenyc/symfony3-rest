# Build on the official Jenkins image.
FROM ubuntu:16.04
MAINTAINER <tgreen@pivotal.io>

# We need root to install things.
USER root

# Install PHP 7 packages.
#RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
#RUN curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add -
RUN apt-get -y update
RUN apt-get -y -f install curl
RUN apt-get -y -f install php7.0 php7.0-mysql php7.0-dom php7.0-mbstring php7.0-curl

# Install PHPUnit.
RUN curl -L -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar
RUN chmod +x /usr/local/bin/phpunit

# Install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get clean -y
