# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Powershell Core
choco install powershell-core -y

# Install Az Powershell Module
choco install az.powershell -y

# Install Azure CLI with pwsh
choco install azure-cli -y

# Install Bicep with pwsh
choco install bicep -y

# Install git with pwsh
choco install git -y

# Install SQLPackage
choco install sqlpackage -y

# Add to PATH
Add-MachinePathItem "C:\Program Files\Git\bin"