#!/bin/sh

if ! [ -x "$(command -v nc)" ]; then
  echo 'fuck, nc is not installed.' >&2
  exit 1
fi

netcat -l 0 &

lsof -i \
| grep $! \
| awk '{print $9}' \
| cut -d':' -f2;

kill $!;
