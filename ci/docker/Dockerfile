# Build on the official Jenkins image.
FROM ubuntu:16.04
MAINTAINER <tgreen@pivotal.io>

# We need root to install things.
USER root

# Install PHP 7 packages.
RUN apt-get -y update
RUN apt-get -y -f install curl git unzip
RUN apt-get -y -f install php7.0 php7.0-mysql php7.0-dom php7.0-mbstring php7.0-curl
RUN apt-get -y -f install sqlite3 libsqlite3-dev php7.0-sqlite3
RUN apt-get -y -f install apt-transport-https

# Include for cf-cli
RUN curl -sS https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get -y update
RUN apt-get -y -f install cf-cli

# Install PHPUnit.
RUN curl -L -o /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar
RUN chmod +x /usr/local/bin/phpunit

# Install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get clean -y
