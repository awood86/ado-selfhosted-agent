# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Powershell Core
choco install powershell-core -y

# Install Az Powershell Module
Install-PackageProvider NuGet -Force
Import-PackageProvider NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Az -Force -AllowClobber
Install-Module -Name Az.Accounts -Force -AllowClobber

# Install Azure CLI with pwsh
choco install azure-cli -y

# Install Bicep with pwsh
choco install bicep -y

# Install git with pwsh
choco install git -y