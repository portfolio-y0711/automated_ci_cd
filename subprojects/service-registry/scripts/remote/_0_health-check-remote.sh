#!/bin/bash

for retry in {1..10}
  do
    HEALTH=$(curl -s $SERVER_LIST:$PORT_LIST/api/health)
    RESULT=$(echo $HEALTH | grep 'up' | wc -l)
    echo -e "  check count: $RESULT\n"
    if [ $RESULT -ge 1 ]; then
        echo -e "▶︎ new server started\n"
        echo -e "  ip: $SERVER_LIST\n"
        echo -e "  port: $PORT_LIST\n"
        break
    fi
    sleep 1
    echo "  ......"
done
