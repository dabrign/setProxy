#!/bin/bash

HTTP_PROXY="export http_proxy"
APTCONF="/etc/apt/apt.conf"
if grep -Fxq "$HTTP_PROXY" ~/.bashrc
then
    echo "Already set"
	read -r -p "do you wanna remove? [y/n]" response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		sed -i '/no_proxy/d' ~/.bashrc
		sed -i '/http_proxy/d' ~/.bashrc
	else
    	echo "ok, no exception then!"
	fi
else
    echo "you can set it now"
	read -r -p "Set your proxy in form user:pwd@proxy:port" response
	echo "http_proxy=$response" >> ~/.bashrc
	echo "export http_proxy" >> ~/.bashrc
	if [ -f $APTCONF ];
	then
		echo "appending, already exists"
	else
		echo "creating..."
		sudo touch $APTCONF
		sudo sh -c 'echo "Acquire::http::Proxy \"$response\";" >> $APTCONF'
	fi
	read -r -p "do you wanna add exceptions? [y/n]" response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
    	read -r -p "Set your proxy exceptions in form ip_add,host1,host2" response
		echo "no_proxy=$response" >> ~/.bashrc
		echo "export no_proxy" >> ~/.bashrc
	else
    	echo "ok, no exception then!"
	fi
	source ~/.bashrc
fi
