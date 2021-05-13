#!/bin/bash

echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎ check variable: registry ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
REGISTRY_LIST=`cat registry.list`
echo -e "▶︎ validating registry number\n"
regex=$(echo '^[0-9]+$')
for REGISTRY in $REGISTRY_LIST; do
  echo -e "  valid registry number: '$REGISTRY'"
  if ! [[ $REGISTRY =~ $regex ]] ; then
    echo "registry.list should contain only numbers ranging from 0 to 9000" >&2; exit 1
  fi
done

