# Disable IE Enhanced Security Configuration
$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0

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

# Install DacFramework
wget -O DacFramework.msi "
https://aka.ms/dacfx-msi"
msiexec.exe /i "DacFramework.msi" /qn

# Add-MachinePathItem function
function Add-MachinePathItem($item) {
    $path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
    $path += ";$item"
    [System.Environment]::SetEnvironmentVariable('Path', $path, 'Machine')
}

# Add Git to PATH
Add-MachinePathItem "C:\Program Files\Git\bin"

# Install Nuget
Install-PackageProvider -Name NuGet -Force -Scope AllUsers

# Install-MSGraph
Install-Module -Name Microsoft.Graph -Scope AllUsers -Repository PSGallery -AllowClobber -Force

# Install SqlServer
Install-Module -Name SqlServer -Scope AllUsers -Repository PSGallery -AllowClobber -Force