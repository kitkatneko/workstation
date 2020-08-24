# pull in case of emergency

in you have lost your applications, reinstall using... and if you did not back your data, well, you are SOL.

     # Install Choco
     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
     # Have Choco do the rest
     cinst -y $( ( [xml]( Invoke-WebRequest -Uri http://softwareList.config) ).packages.package | Select id ).id
