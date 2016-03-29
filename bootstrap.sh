#!/bin/bash --login
# (Using Login Shell for RVM)
#
# Shell provisioner, installs LocomotiveCMS Wagon and all its requirements.
# Conceptually follows the provisioner of rhe rails dev box (https://github.com/rails/rails-dev-box).

# The output of all these installation steps is noisy. With this utility the progress report is nice and concise.
# For more detailed output (i.e. for debugging) remove '>/dev/null 2>&1' from the respective command/function.
sinstall () {
    echo installing $1
    shift
    sudo apt-get -y install "$@" >/dev/null 2>&1
}

# Time to provision the VM
echo updating package information
sudo apt-get -y update >/dev/null 2>&1

echo "Installing dependencies:"
sinstall 'build essentials' build-essential
sinstall 'some libs' libxml2 libxml2-dev libxslt1-dev #nokogiri dependencies

echo "installing RVM and ruby-2.2.3 - depending on your computer and internet connection, this can take up to 20 mins"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 >/dev/null 2>&1
\curl -sSL https://get.rvm.io | bash -s stable >/dev/null 2>&1
source ~/.rvm/scripts/rvm
rvm requirements >/dev/null 2>&1
rvm install ruby-2.2.3 >/dev/null 2>&1
rvm use ruby-2.2.3 --default
rvm rvmrc warning ignore allGemfiles #Disable rvm warning: RVM used your Gemfile for selecting Ruby

echo "installing locomotiveCMS dependencies:"
sinstall 'Imagemagick' imagemagick
gem install rake -N
gem install bundler -N
echo "installing locomotivecms_wagon v2"
gem install locomotivecms_wagon >/dev/null 2>&1

sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 # needed for docs generation.
