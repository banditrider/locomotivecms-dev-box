# This is a modification of the original bootstrap.sh from https://github.com/rails/rails-dev-box
# for the use with LocomotiveCMS

# for more detailed output (i.e. debugging) remove '>/dev/null 2>&1' from the respective commands

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

echo installing RVM and ruby-2.0.0 - this can take up to 20 mins
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 >/dev/null 2>&1
\curl -sSL https://get.rvm.io | bash -s stable >/dev/null 2>&1
source /etc/profile.d/rvm.sh >/dev/null 2>&1
rvm requirements >/dev/null 2>&1
rvm install ruby-2.0 >/dev/null 2>&1
rvm use ruby-2.0 --default

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
#install SQLite sqlite3 libsqlite3-dev
#install memcached memcached
#install Redis redis-server
#install RabbitMQ rabbitmq-server

# Databases
#install PostgreSQL postgresql postgresql-contrib libpq-dev
#sudo -u postgres createuser --superuser vagrant
#sudo -u postgres createdb -O vagrant activerecord_unittest
#sudo -u postgres createdb -O vagrant activerecord_unittest2

#debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
#debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
#install MySQL mysql-server libmysqlclient-dev
#mysql -uroot -proot <<SQL
#CREATE USER 'rails'@'localhost';
#CREATE DATABASE activerecord_unittest  DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
#CREATE DATABASE activerecord_unittest2 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
#GRANT ALL PRIVILEGES ON activerecord_unittest.* to 'rails'@'localhost';
#GRANT ALL PRIVILEGES ON activerecord_unittest2.* to 'rails'@'localhost';
#GRANT ALL PRIVILEGES ON inexistent_activerecord_unittest.* to 'rails'@'localhost';
#SQL

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
#install 'ExecJS runtime' nodejs

# LocomotiveCMS dependencies
sudo apt-get -y install imagemagick >/dev/null 2>&1
echo installing rake
gem install rake -N >/dev/null 2>&1
echo installing locomotivecms_wagon
gem install locomotivecms_wagon -N >/dev/null 2>&1

# clean up installation files 
apt-get -y autoremove >/dev/null 2>&1
# needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo "You are ready to conquer the world with LocomotiveCMS now!"
W_VERSION="$(wagon version)"
echo "wagon version: ${W_VERSION}"
echo "NEXT STEPS: run `vagrant ssh` and change into the shared directory `cd /vagrant`."
echo "There, you can either run `bundle exec wagon serve` to serve an existing project or create a new one in a sub folder with `bundle exec wagon init <project_slug>`."
echo "Check out doc.locomotivehosting.com for help."
