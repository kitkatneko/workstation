# pull in case of emergency

in you have lost your applications, reinstall using... and if you did not back your data, well, you are SOL.

     # Install Choco
     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
     # Have Choco do the rest
     cinst -y $( ( [xml]( Invoke-WebRequest -Uri https://raw.githubusercontent.com/kitkatneko/workstation/master/packagelist.config) ).packages.package | Select id ).id

or use the update-apps.ps1 ...

     git pull
     ./update.ps1
     git commit -m "Updated $env:computername"
     git push

or install-apps.ps1 to do what it says it does.

     git pull
     # edit packagelist.config to add <package name="mypackage" />
     ./install.ps1
     git commit -m "Installed mypackage"
     git push