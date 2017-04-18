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
    npm config set proxy http://proxy.company.com:8080
    npm config set https-proxy http://proxy.company.com:8080
    npm config delete proxy
    npm config delete https-proxy
* PIP & CONDA
Env var works for pip
* GIT
git config --global http.proxy {{url}}
git config --global https.proxy {{url}}
git config --global --unset https.proxy
git config --global --unset http.proxy

* docker
File http-proxy.conf in /etc/systemd/system/docker.service.d with:

[Service]
Environment="HTTP_PROXY=  "

* maven
.m2/settings
