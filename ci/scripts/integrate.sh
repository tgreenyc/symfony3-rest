#!/usr/bin/env bash
set -e

cd git-repo
composer install
vendor/bin/phpunit -vvv tests/AppBundle/Controller/UserControllerTest.php
