# setProxy
simple bash script to set and remove proxy from the command line

**Supported services**

* Bash
* Apt
* Gnome

**Other needed services**

* NPM
* PIP & CONDA
* GIT
* docker
File http-proxy.conf in /etc/systemd/system/docker.service.d with:

[Service]
Environment="HTTP_PROXY=  "
