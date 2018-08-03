#!/bin/bash
RED=`tput setaf 1`
RESET=`tput sgr0`
DATE=`date "+%Y-%m-%d %H:%M:%S"`

echo "Good Morning, sir."
sleep 1;
echo "It's currently ${DATE}."
sleep 1;
read -r -p "Would like to grab the latest updates? [y/N]"
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
      cd
      apt update && apt upgrade
  else
    echo "Okay, I'll ask again tomorrow."
  fi
sleep 2;
echo "What project will you be working on today?"
read projectAnswer
echo "Ahhhh the ${projectAnswer}, I like that one."
sleep 2;
echo "Pulling latest changes now"
cd
cd /root/${projectAnswer}
git pull

