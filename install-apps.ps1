# ./install.ps1 installs all packages listed in packagelist.config in the current directory.
# 
# It then calls ./record.ps1 to note down the currently installed package versions for all
# packages in packagelist.config.
#
# * In order to add a new package, add <package name="mypackage" /> line to packagelist.config
#   and run ./install.ps1
# * To update, refer to ./update.ps1
# * To install for the first time / install chocolatey, run:
# 
# 	  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#

choco feature enable -n useRememberedArgumentsForUpgrades

# upgrade chocolatey first
choco upgrade -y chocolatey

# install packages listed in packagelist.config
choco install -y packagelist.config

echo "You may need to run refreshenv / Update-SessionEnvironment to put newly installed programs on the path."
echo "See ./update.ps1 to list and update outdated packages"

./record.ps1