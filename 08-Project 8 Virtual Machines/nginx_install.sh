#!/bin/bash

sudo apt update

sudo apt install -y nginx 

sudo systemctl enable nginx

sudo systemctl start nginx

sudo systemctl status nginx

sudo systemctl stop nginx

sudo apt remove -y nginx 

#Prior to running ./nginx_install.sh, make sure you have the correct chmod permissions to execute this.
# -y after the install and remove functions of apt allows for faster installs and removals, which basically says "yes" to the requests.

