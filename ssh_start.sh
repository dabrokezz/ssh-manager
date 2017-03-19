#!/bin/bash

testServerAddress="vps129122.ovh.net"
prodServerAddress="vps30304.ovh.net"
 
startMessage() {
	echo -e "SSH connection to UPNBIZ servers"
}

selectEnvironnement() {
	echo 'Please, select an environement :'
	echo -e "test 		\033[32m-- test environnement\033[0m"
	echo -e "prod 		\033[32m-- production environnement\033[0m"
	read -p 'choice? ' selectedEnv
	
	case $selectedEnv in
		"test")
			echo "Test environnement selected"
			;;
		"prod")
			echo "Production environnement selected"
			;;
		*)
			echo -e "\033[31mBad parameter given!\033[0m"
			selectEnvironnement
			;;
	esac
}

launchSSH() {
	case $selectedEnv in
		"test")
			echo 'ok'
			serverAddress=$testServerAddress
			;;
		"prod")
			serverAddress=$prodServerAddress
			;;
	esac
	
	ssh root@$serverAddress
}

startMessage
selectEnvironnement
launchSSH
