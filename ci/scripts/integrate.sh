#!/usr/bin/env bash
set -e

cd git-repo
composer install

mkdir -p var/data
if [ $? -ne 0 ]; then
  echo "[ERROR]: unable to create database directory."
  exit 1
fi

php bin/console doctrine:database:create -e dev
php bin/console doctrine:schema:update --force
php bin/console doctrine:fixtures:load -n

vendor/bin/phpunit tests/AppBundle/Controller/UserControllerTest.php
