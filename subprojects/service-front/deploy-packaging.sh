#!/bin/bash

FILE_NAME=front
PROJECT_FILES=$(echo "bin dist scripts deploy-local.sh terminate-local.sh tsconfig.json package.deploy.json port.list server.list registry.list .npmrc")

echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎ compress project files ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
tar cvzf $FILE_NAME.tar.gz $PROJECT_FILES 
# &>/dev/null
echo -e "▶︎ compressed\n"
echo -e "  files: $PROJECT_FILES"
