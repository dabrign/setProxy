#!/bin/bash
HTTP_PROXY="export http_proxy"
HTTPS_PROXY="export https_proxy"
FTP_PROXY="export ftp_proxy"
APTCONF="/etc/apt/apt.conf"
if grep -Fxq "$HTTP_PROXY" ~/.bashrc
then
    echo "Already set"
	read -r -p "do you wanna remove? [y/n]" response
	if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		sed -i '/no_proxy/d' ~/.bashrc
		sed -i '/http_proxy/d' ~/.bashrc
		sed -i '/https_proxy/d' ~/.bashrc
		sed -i '/ftp_proxy/d' ~/.bashrc
		sudo sed -i '/Acquire::http::Proxy/d' $APTCONF
		gsettings set org.gnome.system.proxy mode 'none'
	else
    	echo "ok, no exception then!"
	fi
else
	gsettings set org.gnome.system.proxy mode 'manual'
    echo "you can set it now"
	read -r -p "Set your proxy in form http://user:pwd@proxy:port : " response
	echo "http_proxy=$response" >> ~/.bashrc
	echo "https_proxy=$response" >> ~/.bashrc
	echo "ftp_proxy=$response" >> ~/.bashrc
	echo "export http_proxy" >> ~/.bashrc
	echo "export https_proxy" >> ~/.bashrc
	echo "export ftp_proxy" >> ~/.bashrc
	if [ -f $APTCONF ];
	then
		echo "appending" 
	else
		echo "creating..."
		sudo touch $APTCONF
		
	fi
	sudo sh -c " echo 'Acquire::http::Proxy \"$response\" ;' >> $APTCONF"
	
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
