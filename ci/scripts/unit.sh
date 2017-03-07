#!/usr/bin/env bash
set -e

cd git-repo
composer install
vendor/bin/phpunit tests/AppBundle/Util/CalculatorTest.php
