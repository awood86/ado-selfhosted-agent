# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Powershell Core
choco install powershell-core -y

# Install Az Powershell Module
pwsh -c "Install-Module -Name Az -AllowClobber -Scope AllUsers -Force"

# Install Azure CLI with pwsh
pwsh choco install azure-cli -y

# Install Bicep with pwsh
pwsh choco install bicep -y

# Install git with pwsh
pwsh choco install git -y