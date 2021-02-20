#!/bin/bash
if (( $EUID != 0 )); then
    echo "Sudo is your best friend.."
    exit
fi
sleep 1 

interface=$(iwconfig 2>/dev/null | grep -B 1 -i 'mode'| cut -d ' ' -f 1)
echo  'Detected Interface:' $interface

echo 



if [ $(iwconfig 2>/dev/null | grep -B 1 -i 'mode'| cut -d ' ' -f 11| cut -d ':' -f 2) == Monitor ] 
then echo 'Monitor mode detected. Entering Managed mode.' 



	sudo airmon-ng stop $interface && sudo systemctl restart NetworkManager.service
else echo 'Managed mode detected. Entering Monitor  mode.'
	sudo airmon-ng check kill >/dev/null && sudo airmon-ng start $interface
fi 

echo 'Made from THETR4CKER and Rikoss for Audax cybersecurity discord community server'
echo 'Audax Discord Server: https://discord.gg/BkmSQVdtuc'
