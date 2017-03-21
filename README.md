# setProxy
simple bash script to set and remove proxy from the command line

**Supported services**

* Bash
* Apt
in /etc/apt/apt.conf
Acquire::http::Proxy "http://{{user}}:{{pasword}}@{{proxyurl:port}}" ;

* Gnome

**Other needed services**

* NPM
* PIP & CONDA
* GIT
* docker
File http-proxy.conf in /etc/systemd/system/docker.service.d with:

[Service]
Environment="HTTP_PROXY=  "

* maven
.m2/settings
