#!/bin/bash

APPNAME=symfony3-rest
COMPOSER=`which composer`

if [ ! -d vendor ]; then
  if [ -z $COMPOSER ]; then
    echo '[ERROR]: Please install composer first'
    exit 1
  else
    $COMPOSER install
  fi
fi

cf push
cf run-task $APPNAME "bin/console doctrine:schema:update --force"
cf run-task $APPNAME "bin/console doctrine:fixtures:load"
