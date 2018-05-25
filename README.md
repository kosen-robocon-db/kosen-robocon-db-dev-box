# Vagrant scripts for Kosen Robocon DB Development Box

## Introduction

`kosen-robocon-db-dev-box` automates the setup of a development environment for working on Ruby on Rails for the Kosen Robocon Database Site. It consits of a Vagrant script and some shell scripts in order to build and provision a virtual machine image (box).

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How to build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/kosen-robocon-db/kosen-robocon-db-dev-box.git [your favorite directory name]
    host $ cd [your favorite directory name]
    host $ vagrant up

That's it.

After the installation has finished, you can access the virtual machine with

    host $ vagrant ssh
    Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)
    ...
    vagrant@robocon:~$

Port 3000 in the host computer is forwarded to port 3000 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer. Be sure the web server is bound to the IP 0.0.0.0, instead of 127.0.0.1, so it can access all interfaces:

    bin/rails server -b 0.0.0.0

## RAM and CPUs

By default, the VM launches with 2 GB of RAM and 2 CPUs.

These can be overridden by setting the environment variables `RAILS_DEV_BOX_RAM` and `RAILS_DEV_BOX_CPUS`, respectively. Settings on VM creation don't matter, the environment variables are checked each time the VM boots.

`RAILS_DEV_BOX_RAM` has to be expressed in megabytes, so configure 4096 if you want the VM to have 4 GB of RAM.

## How to create a virtual image from linux distro

Before you vagrant up, you need to touch the file CREATION_FROM_DISTRO in the same directory to Vagrantfile like this:

    host $ ls
    .vagrant bootstrap_user.sh bootstrap_root.sh Vagrant_file
    host $ touch CREATION_FROM_DISTRO
    host $ vagrant up

and then the new kosen-robocon-db-dev-box image will be created. (For details of the later work, please refer to the [Vagrant Documentation site](https://www.vagrantup.com/docs/index.html).)  It is the same even if you create the file CREATION_FROM_DISTRO on GUI like Windows.

Before you vagrant up for the second time, don't forget to remove the file CREATION_FROM_DISTRO, or then virtual image creation will start again.  

## What's In The Box

* Development tools

* Git

* rbenv

* Ruby 2.5.1

* Bundler

* SQLite3, and Postgres 10 client 

* System dependencies for nokogiri, sqlite3, pg

* An ExecJS runtime

* Heroku CLI

* Rails 5.2.0 or higher

## Thanks

This software is created with reference to the [rails-dev-box](https://github.com/rails/rails-dev-box).
See also the [rails-dev-box](https://github.com/rails/rails-dev-box).

## License

Released under the MIT License, Copyright (c) 2018–<i>ω</i> kosen-robocon-db and the authors.
See also LICENSE.
