# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git
choco install git -y

# Install Azure CLI
choco install azure-cli -y

# Install Powershell Core
choco install powershell-core -y

# Install Az Powershell Module
choco install az.powershell

# Install Bicep
choco install bicep -y