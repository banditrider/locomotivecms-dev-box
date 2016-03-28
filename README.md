# A Virtual Machine that Painlessly Sets Up a LocomotiveCMS Wagon for Local Development#

## Why use this VM? ##

Because it's two commands and a little waiting time to set up the entire wagon environment for LocomotiveCMS development. 

As a bonus, no more issues with development on Windows and different Ruby Versions.

## Setting up the development environment ##

1. If you haven't done so, first install [VirtualBox](https://www.virtualbox.org/) and then [Vagrant](https://www.vagrantup.com/).
2. Download/clone this repository.
3. Now move the files into the correct location:
	- For an existing LocomotiveCMS site, put the `Vagrantfile` and `bootstrap.sh` into your site's root folder (i.e. where the Gemfile is). 
	- If you don't have a LocomotiveCMS project yet, create a folder and copy the `Vagrantfile` and `bootstrap.sh` into this new folder.
4. Use your favorite cmd tool to change into the folder where you moved the files and run `vagrant up`. This will take 5-20 minutes. When run successfully, the last output will be `wagon version: ` followed by a version number (e.g. `1.5.4`). If the version number is not there, most probably the RVM installation went awry.
5. Now run `vagrant ssh`. 
6. Change to your synchronized folder by running `cd /vagrant`:
	- If you're running this VM in an existing LocomotiveCMS site, you can run `bundle install` and `bundle exec wagon serve` to preview your site from your browser as usual.
	- To create a new site, follow the [LocomotiveCMS tutorial](http://doc.locomotivecms.com/making-blog/1-1-create-wagon-site).

#### Hints:

- If you have trouble SSHing into your box (on Windows, with `vagrant ssh`) then add the path to a ssh.exe (e.g. included with Git or clients like SourceTree) to your host system's path variable. That did the trick for me.
- You can leave your VM by typing exit when you're SSHed into your VM.
- Need to destroy your VM? Use `vagrant destroy`.
- Check out [this section](https://github.com/rails/rails-dev-box#virtual-machine-management) on the rails-dev-box repo for more info about handling the VM.

## Workflow ##

1. Edit your site on your host computer
2. Use the VM for all the wagon functionality, e.g. generators, serving/pushing/pulling sites etc.

## What's In The Box ##

- Development Tools
- RVM with Ruby 2.0.0
- Bundler
- Rake
- Imagemagick
- **LocomotiveCMS Wagon**

## Disclaimer ##

Provided as-is. Use at your own risk. Tested so far only on Windows 8.

I'm happy to receive feedback for improvement of this VM.

## Debugging ##

Most outputs of the provisioning processed are suppressed. If something does not install properly, open the `bootstrap.sh` file and remove `>/dev/null 2>&1` from any command you suspect to go awry. 
