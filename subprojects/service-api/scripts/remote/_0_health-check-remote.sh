#!/bin/bash

for retry in {1..30}
  do
    for SERVER in $SERVER_LIST; do
        for PORT in $PORT_LIST; do
            URL=$SERVER:$PORT
            HEALTH=$(curl -s $URL/api/health)
            RESULT=$(echo $HEALTH | grep 'up' | wc -l)
            echo -e "  check count: $RESULT\n"
            if [ $RESULT -ge 1 ]; then
                echo -e "▶︎ new server started\n"
                echo -e "  ip: $SERVER\n"
                echo -e "  port: $PORT\n"
                exit 0
            fi
            sleep 1
            echo "  ......"
        done
    done
done

