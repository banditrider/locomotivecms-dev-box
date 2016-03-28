#!/bin/sh
# Runs on every vagrant up.

# Beautiful colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

sudo apt-get -y autoremove >/dev/null 2>&1 # Routine cleanup

# Some info for the user
echo "You are ready to conquer the world with LocomotiveCMS now!"
echo "Wagon version: ${YELLOW}`wagon version`${NC}"
echo "${GREEN}NEXT STEPS: run 'vagrant ssh' and change into the shared directory 'cd /vagrant'.${NC}"
echo "There, you can either run 'bundle exec wagon serve' to serve an existing project or create a new one in a sub folder with 'bundle exec wagon init <project_slug>', 'cd <project_slug', 'bundle install'."
echo "LCMS/Wagon docs: doc.locomotivehosting.com."
