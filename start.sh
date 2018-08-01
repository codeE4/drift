#!/bin/bash
RED=`tput setaf 1`
RESET=`tput sgr0`
DATE=`date "+%Y-%m-%d %H:%M:%S"`

echo "Welcome, sir."
echo "It's currently ${DATE}."
sleep 2;
echo "Starting in 3..."
sleep 1;
echo "Starting in 2..."
sleep 1;
echo "Starting in 1..."
sleep 1;

  echo "Who are we attacking?"
  read target
  echo $target > ~/.$target.txt
  sleep 1;
  echo "Target: ${RED}"$target"${RESET}"

  echo "What is their domain?"
  read domainName
  echo $domainName > ~/.$target.txt
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
  echo "---------------------------WHOIS------------------------------------" >> ~/.$target.txt
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
  
        whois $target > ~/.$target.txt

  sleep 3;
  echo "Whois of ${RED}"$target"${RESET} was placed in their file, sir."
  sleep 5;

  echo "Getting their IPs, I'll place them in ${RED}"$target"${RESET}'s file."
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
  echo "---------------------------NSLOOKUP---------------------------------" >> ~/.$target.txt
  echo "--------------------------------------------------------------------" >> ~/.$target.txt
        
        nslookup $domainName >> ~/.$target.txt

  read -r -p "Sir, it may be wise to do this work in a more private sector. Would you like me to create a new container for you? [y/N] " response
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

  echo "Transfering ${RED}"$target"${RESET}'s file to the container"
  lxc file push ~/.$target.txt lab/root/.$target.txt

  echo "I'll put you in the lab now, to set up your VPN"
  sleep 2;

  echo "H4PPY H4CK1NG!"
  sleep 2;

  lxc exec lab bash 

