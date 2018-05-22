#!/usr/bin/env bash

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

# setting time zone
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

echo Updating package information and upgrade packages
apt-get -y update >/dev/null 2>&1
apt-get -y upgrade >/dev/null 2>&1

# Installing packages for Ruby and Rails
echo Installing Ruby/Rails dependencies
install 'Development tools' build-essential autoconf libtool
install 'Line editing library' libreadline-dev
install 'Open SSL library toolkit' libssl-dev
install SQLite sqlite3 libsqlite3-dev
install PostgreSQL postgresql-client-10 libpq-dev
install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'ExecJS runtime (nodejs)' nodejs

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'root part bootstrap done.'
