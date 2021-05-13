#!/bin/bash

echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎  wait until registry run ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
echo -e "▶︎ new server health check\n"

TERMINATE=true
for retry in {1..20}
  do
    HEALTH=$(curl -s http://localhost:$REGISTRY/api/health)
    RESULT=$(echo $HEALTH | grep 'up' | wc -l)
    echo -e "  check count: $RESULT"
    if [ $RESULT -ge 1 ]; then
        echo -e "  registry server is running"
        TERMINATE=false
      break
    fi
    sleep 3
    echo "  ......"
done

if [ $TERMINATE = true ]; then
  echo -e "  registry server is not running"
  exit 1
fi

