#!/bin/bash
HOST=$1
shift
for ARG in "$@"
do
        nmap -Pn --host-timeout 100 --max-retries 0 -p $ARG $HOST
done

#to run ssh, ensert this commands, before end 30 seconds
#/home/vagrant/knock.sh 192.168.255.1 8881 7777 9991
#ssh root@192.168.255.1
