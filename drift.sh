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
sleep 2;
read -r -p "Okay! Should I do a pull for ${projectAnswer}? [y/N]"
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
      cd
      cd /root/${projectAnswer}
      git pull
  else
    echo "Okay! Just check for changes before pushing!"
  fi


sleep 1;
echo "Starting in 2..."
sleep 1;
echo "Starting in 1..."
sleep 1;

  echo "---------------------"
  echo "Who are we attacking?"
  echo "---------------------"
  read target
  echo $target > ~/.$target.txt
  sleep 1;

  echo "-----------------------------------------"
  echo "What is ${RED}"$target"${RESET}'s domain?"
  echo "-----------------------------------------"
  read domainName
  echo $domainName > ~/.$target.txt
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
  echo "---------------------------WHOIS------------------------------------" >> ~/.$target.txt
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
  
        whois $target > ~/.$target.txt

  sleep 3;
  echo "---------------------------------------------------------------"
  echo "Whois of ${RED}"$target"${RESET} was placed in their file, sir."
  echo "---------------------------------------------------------------"
  sleep 5;

  echo "--------------------------------------------------------------------"
  echo "Getting their IPs, I'll place them in ${RED}"$target"${RESET}'s file."
  echo "--------------------------------------------------------------------"
  echo "---------------------------NSLOOKUP---------------------------------" >> ~/.$target.txt
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
        
        nslookup $domainName >> ~/.$target.txt

  echo "-------------------------------------------------------------------------------------------------------------------------------"
  read -r -p "Sir, it may be wise to do this work in a more private sector. Would you like me to create a new container for you? [y/N] " response
  echo "-------------------------------------------------------------------------------------------------------------------------------"
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        cd /root/lab; photon container --delete; photon container --clone=base; 
    else
        echo "Hmmmmm, okay."
    fi
     
  sleep 2;

  echo "--------------------------------------------------------------------"
  echo "-------------Your container has been created.-----------------------"
  echo "--------------------------------------------------------------------"
  sleep 1;
  echo "--------------------------------------------------------------------"
  echo "------------------------Port-a-fort---------------------------------"
  echo "--------------------------------------------------------------------"
  sleep 2;

  echo "--------------------------------------------------------------------"
  echo "Transfering ${RED}"$target"${RESET}'s file to the container"
  echo "--------------------------------------------------------------------"
  lxc file push ~/.$target.txt lab/root/.$target.txt

  echo "--------------------------------------------------------------------"
  echo "I'll put you in the lab now, to set up your VPN"
  echo "--------------------------------------------------------------------"
  sleep 2;

  echo "H4PPY H4CK1NG!"
  sleep 2;
  echo "---------------------------------------------------------"
  echo "----------------Dont do anything illegal-----------------"
  echo "---------------------------------------------------------"
  echo "--------------------------or-----------------------------"
  echo "--------------------S------------------------------------"
  echo "-------------------------T-------------------------------"
  echo "-------------------------------A-------------------------"
  echo "------------------------------------Y--------------------"
  echo "-------------------------------A-------------------------"
  echo "-------------------------N-------------------------------"
  echo "--------------------O------------------------------------"
  echo "---------------N-----------------------------------------"
  echo "---------Y-----------------------------------------------"
  echo "---M-----------------------------------------------------"
  echo "---------O-----------------------------------------------"
  echo "---------------U-----------------------------------------"
  echo "---------------------S-----------------------------------"
  echo "---------------------------------------------------------"
  
  lxc exec lab bash 

