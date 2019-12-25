#!/usr/bin/env bash

# Taken from she-bang line from this sof link
# https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang

# The script determines the OS of the system it is invoked in and invokes the
# appropriate setup script which installs all the packages declared in this repo

# Additionally, if you want to install only a specific package, it is not
# required to run this script. Invoking the setup.sh of the respective directory
# will also get the job dones

case $(uname) in
Darwin)
  # For MacOS
  ./installation_scripts/first_run_mac.sh
  ;;
Linux)
  # For *nix systems
  ./installation_scripts/first_run_linux.sh
  ;;
esac
