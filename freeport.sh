#!/bin/sh

if ! command -v nc &> /dev/null
then
    echo "fuck, netcat was not installed."
    exit
fi

netcat -l 0 &

lsof -i \
| grep $! \
| awk '{print $9}' \
| cut -d':' -f2;

kill $!;
