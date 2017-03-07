#!/usr/bin/env bash
set -e

cd git-repo

cf login -a $CF_API -u $CF_USER -p $CF_PASS -o $CF_TEST_ORG -s $CF_TEST_SPACE
cf run-task $APPNAME "bin/console doctrine:schema:update --force"
cf run-task $APPNAME "bin/console doctrine:fixtures:load -n"
