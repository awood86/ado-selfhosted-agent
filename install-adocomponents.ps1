#  Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install PWSH
choco install powershell-core -y

# Install AZ CLI
choco install azure-cli -y

# Install git
choco install git -y

# Instal AZ Powershell
choco install az.powershell -y

# Install Bicep
choco install bicep -y