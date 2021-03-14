#!/bin/bash
set -e
source .env
perl -i -pe s/yourpasswordhere/$PASSWORD/g ./fluentd/fluent-app-protect.conf

if [ `cat /proc/sys/vm/max_map_count` -lt 262144 ]

then
echo "max_map_count too low. run:"
echo "sudo sysctl -w vm.max_map_count=262144"
echo "and this to persist reboot:"
echo "echo \"vm.max_map_count=262144\" | sudo tee -a /etc/sysctl.conf"
echo "then run this script again"

else
docker-compose up --build
fi
