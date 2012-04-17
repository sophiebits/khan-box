# The “Khan Box”

Setting up a new machine with all the software you need is a huge pain. Instead, here's a way to set up a virtual machine (using [Vagrant](http://vagrantup.com/) and [Chef](http://www.opscode.com/chef/)) that contains everything you need.

## What's in the box?

The virtual machine runs Ubuntu 10.04 “Lucid Lynx”. By default, it is configured with 384 MB of RAM and an dynamically allocated disk of size up to 80 GB, but you can change these settings after the machine is created if you'd like.

The software installed automatically is:

* Python 2.5 with pip and virtualenv
* Google App Engine SDK for Python

## Installation

First, install [VirtualBox](http://www.virtualbox.org/) and [Vagrant](http://vagrantup.com/).

If you don't want VirtualBox to make and use the directory `~/VirtualBox VMs/`, tell it now to use a different one like so:

    VBoxManage setproperty machinefolder ~/Documents/VirtualBox\ VMs/

Then, clone this repository and run:

    cd khan-box
    git submodule update --init
    vagrant up

and Vagrant will create and run a new headless virtual machine in VirtualBox, provisioning it with all of the software you need. To set up an easy way to SSH into the virtual machine, run

    vagrant ssh-config --host khan-box >>~/.ssh/config

and then you can SSH into the box by simply running `ssh khan-box`.
