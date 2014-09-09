# basebox

This is a project I use to configure environments for my projects.

## Setup

### Step 1 Install VirtualBox

[VirtualBox](https://www.virtualbox.org) is a free VM player given to use by 
Oracle.  [Download Virtual](https://www.virtualbox.org/wiki/Downloads).

Install VirtualBox to your development machine.

### Step 2 Install Vagrant

[Vagrant](http://www.vagrantup.com/) is a free provider of virtual machines. 
Using their plugin allows you to quickly download and provision a development 
environment in less time than it takes to read all this README document.

## Clone me!

As with any github project, you can clone this project using your github client
or via the git terminal using the URL provided somewhere else on this page.

## Start Vagrant

From the cloned basebox directory, use `vagrant up *profilename*` to load and 
provision a VM for a profile.

## About basebox

This is a provisioning convention I'm trying to develop.  I'm trying to start
with an environment that everyone feels comfortable with (centos), and adding
the most common dependencies I need to do my daily development work.

I've install Jenkins, Java, Maven, NodeJS, MongoDB and PhantomJS.  In addition
to Jenkins, I've installed a large number of popular Jenkins plugins and a 
sample Jenkins job.

I want this project to be very portable, therefore I designed the provision 
scripts to download files from the remote sources and cache them in the files 
folder (these files are ignored via .gitignore).  This ends up being very 
valuable when rapidly prototyping changes to the basebox.

## How do I read this source code?

The best place to start is by reading the Vagrantfile in the root of this folder.

The Vagrant file describes how to configure the VM Player, and how to provision
the VM from the basebox.  In this case, our basebox, is a puppetlabs/centos 6.5 
64bit box.

Once the VM is mounted onto your VM player, the provisioner will execute all the
shell scripts in sequential order.  Each of the scripts is intended to either 
optimistically update (eg: `yum -y install [...]`) or to idempotently cache
dependencies locally before applying them to the basebox.  For example, when 
installing Java, the provisioner will look for the Java installer locally. When
the provisioner cannot find the Java installer locally, it will attempt to 
download the installer from the internet.

Most of the shell scripts represent a common workflow that can be configured.
One example of this is Jenkins jobs.  There is a convention within 
install-jenkins-jobs.sh that allows a box builder to simply add a new .xml and
the provisioner will automatically create the job during the next provision. 
The same happens for Jenkins configs and plugins.

## What sort of things did you learn while doing this?

I found out you can store shell scripts in /etc/profile.d and they will run for 
every user account.  This is the ideal way to store environment variables like
$JAVA_HOME or updates to $PATH.

It's better to use a README file than a .gitkeep file to keep a folder in source
control.

It's better to use 1 Vagrant file for multiple configurations than it is to use 
a Vagrant file for each project.  As you develop profiles for different kinds of 
boxes, it will become more difficult to manage these configurations if they are 
not easy to find.  Additionally, as Vagrant makes it easy to forward ports from 
the gueset OS to the local machine, having multiple configuration files may make
it difficult to recall which machine uses which ports.

Another reason to use 1 Vagrant file is to reduce the copies of any provisioning
tools.  In the case of this project, in order use the provisions in another 
project, the developer would need to copy all the provisions from this project 
the other project -- creating a copy of the code that must be maintained in two 
places now.