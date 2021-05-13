#!/bin/bash
PROJECT=service-gateway
PROJECT_HOME=$(pwd)

SERVER_LIST=`cat server.list`
PORT_LIST=`cat port.list`

USER_ID=yoonsung0711
FILE_NAME=gateway

DEPLOY_PATH=/home/yoonsung0711/feeds/$PROJECT
FILE_PATH=$PROJECT_HOME/$FILE_NAME.tar.gz
DATE_TIME=`date +%Y-%m-%d-%H-%M-%S`

PROJECT_FILES=$(echo "assets bin cli config scripts settings src deploy-local.sh terminate-local.sh tsconfig.json package.deploy.json port.list server.list registry.list .npmrc")

echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎ compress project files ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
#tar czf $FILE_NAME.tar.gz $PROJECT_FILES &>/dev/null
tar czf $FILE_NAME.tar.gz $PROJECT_FILES 
echo -e "▶︎ compressed\n"
echo -e "  files: $PROJECT_FILES"


for SERVER in $SERVER_LIST; do
  echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎   create deploy path   ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
  echo -e "▶︎ create deploy path\n"
  echo -e "  path: $DEPLOY_PATH"
  ssh -i /home/yoonsung0711/.ssh/id_rsa $USER_ID@$SERVER "mkdir -p $DEPLOY_PATH"

  echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎  copy compressed file  ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
  echo -e "▶︎ copy compressed file\n"
  echo -e "  file: ${PROJECT}_${DATE_TIME}.tar.gz"
  #scp $FILE_PATH $USER_ID@192.168.56.105:$DEPLOY_PATH/${PROJECT}_${DATE_TIME}.tar.gz &>/dev/null
  #scp $FILE_PATH $USER_ID@SERVER:$DEPLOY_PATH/${PROJECT}_${DATE_TIME}.tar.gz &>/dev/null
  scp -i /home/yoonsung0711/.ssh/id_rsa $FILE_PATH $USER_ID@$SERVER:$DEPLOY_PATH/${PROJECT}_${DATE_TIME}.tar.gz &>/dev/null

  echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎    decompress files    ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
  echo -e "▶︎ decompressed\n"
  echo -e "  path: $DEPLOY_PATH\n"
  echo -e "  files: $PROJECT_FILES"
  ssh -i /home/yoonsung0711/.ssh/id_rsa $USER_ID@$SERVER "tar zxf $DEPLOY_PATH/${PROJECT}_${DATE_TIME}.tar.gz -C $DEPLOY_PATH"

  echo -e '\n◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎      start server      ◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎◼︎\n'
  ssh -i /home/yoonsung0711/.ssh/id_rsa $USER_ID@$SERVER "mv $DEPLOY_PATH/package.deploy.json $DEPLOY_PATH/package.json"
  ssh -i /home/yoonsung0711/.ssh/id_rsa $USER_ID@$SERVER ". ~/.nvm/nvm.sh && (cd $DEPLOY_PATH && npm install --prefix $DEPLOY_PATH)"
  # ssh $USER_ID@$SERVER ". ~/.nvm/nvm.sh && (cd $DEPLOY_PATH && npm install --prefix $DEPLOY_PATH > /dev/null 2>&1 &)"
  ssh -i /home/yoonsung0711/.ssh/id_rsa $USER_ID@$SERVER ". ~/.nvm/nvm.sh && (cd $DEPLOY_PATH && npm run stop --prefix $DEPLOY_PATH)"
  # ssh $USER_ID@$SERVER ". ~/.nvm/nvm.sh && (cd $DEPLOY_PATH && npm run stop --prefix $DEPLOY_PATH > /dev/null 2>&1 &)"
  ssh -i /home/yoonsung0711/.ssh/id_rsa $USER_ID@$SERVER ". ~/.nvm/nvm.sh && (cd $DEPLOY_PATH && DOMAIN=http://$SERVER nohup npm run start --prefix $DEPLOY_PATH > /dev/null 2>&1 &)"
  # ssh $USER_ID@$SERVER ". ~/.nvm/nvm.sh && (cd $DEPLOY_PATH && nohup DOMAIN=http://$SERVER npm run start --prefix $DEPLOY_PATH > /dev/null 2>&1 &)"
  source ./scripts/remote/_0_health-check-remote.sh
done
