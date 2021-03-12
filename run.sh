#!/bin/bash
set -e
source .env
sed -i s/yourpasswordhere/$PASSWORD/g ./fluentd/fluent-app-protect.conf
docker-compose up --build