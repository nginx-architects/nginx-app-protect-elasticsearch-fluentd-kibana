#!/bin/bash
set -e
source .env
perl -i -pe s/yourpasswordhere/$PASSWORD/g ./fluentd/fluent-app-protect.conf
docker-compose up --build
