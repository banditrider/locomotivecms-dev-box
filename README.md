# A Virtual Machine that Painlessly Sets Up a LocomotiveCMS Wagon for Local Development#

## Why use this VM? ##

Because it's two commands and a little waiting time to set up the entire wagon environment for LocomotiveCMS development. 

As a bonus, no more issues with development on Windows and different Ruby Versions.

## Setting up the development environment ##

### Requirements

You should have these programs installed:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

### Installation

1. Download/clone this repository.
3. Now move the files into the correct location:
	- For an existing LocomotiveCMS site, put the `Vagrantfile` and `bootstrap.sh` into your site's root folder (i.e. where the Gemfile is). 
	- If you don't have a LocomotiveCMS project yet, create a folder and copy the `Vagrantfile` and `bootstrap.sh` into this new folder.
4. Change into the directory where you put the Vagrantfile and run:

	vagrant up (will take 5 to 20 mins)
	vagrant ssh
	cd /vagrant

6. Get your site up and runing:
	- If you're running this VM in an existing LocomotiveCMS site, you can run `bundle install` and `bundle exec wagon serve` to preview your site from your browser as usual.
	- To create a new site, run `wagon init <project-slug>`.


## Working with the VM

### General workflow

1. Edit your site on your host computer
2. Use the VM for all the wagon functionality, e.g. generators, serving/pushing/pulling sites etc.

### Handling the VM

The standard Vagrant and SSH Commands apply:

1. Starting the VM: `vagrant up`
2. Leaving the VM after SSHing into it: `exit`
3. Shutting down the VM: `vagrant halt`
4. Restarting the VM: `vagrant reload`
5. Destroying the VM: `vagrant destroy`


### Troubleshooting:

- If you have trouble SSHing into your box (on Windows, with `vagrant ssh`) then add the path to a ssh.exe (e.g. included with Git or clients like SourceTree) to your host system's path variable. That did the trick for me.
- Most outputs of the provisioning processed are suppressed. If something does not install properly, open the `bootstrap.sh` file and remove `>/dev/null 2>&1` from any command you suspect to go awry.


## What's In The Box ##

- Development Tools
- RVM with Ruby 2.2.3
- Bundler
- Rake
- Imagemagick
- **LocomotiveCMS Wagon** v2+

## Disclaimer ##

Provided as-is. Use at your own risk. Tested so far only on Windows 10.

I'm happy to receive feedback for improvement of this VM.
