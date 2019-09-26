#!/usr/bin/env bash

interrupt() {
  echo
  echo "Caught ^C, exiting."
  exit 1
}

trap interrupt SIGINT

#Accept terms on restart
./dehydrated --register --accept-terms

#Create domains.txt file if not exist.
if [ ! -f /letsencrypt/domains.txt ]; then
   echo "www.test.domain.com" > /letsencrypt/domains.txt
fi

while true; do
  ./dehydrated --cron --hook /dns/hook --challenge dns-01
  ./dehydrated --cleanup
  inotifywait --timeout 86400 /letsencrypt/domains.txt
  sleep 60
done
