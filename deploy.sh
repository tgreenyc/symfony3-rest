#!/bin/bash

APPNAME=symfony3-rest

cf push
cf run-task $APPNAME "bin/console doctrine:schema:update --force"
cf run-task $APPNAME "bin/console doctrine:fixtures:load"
