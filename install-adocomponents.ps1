# Download the installer
Invoke-WebRequest -Uri "https://aka.ms/install-powershell.ps1" -OutFile "install-powershell.ps1"

# Run the installer
Invoke-Expression "& { ./install-powershell.ps1 }"

# Remove the installer
Remove-Item -Path "install-powershell.ps1"

# Install the Az module
Install-Module -Name Az -AllowClobber -Scope AllUsers -Force

# Install Azure CLI
Invoke-WebRequest -Uri "https://aka.ms/installazurecliwindows" -OutFile "AzureCLI.msi" -UseBasicParsing

# Run the installer
Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'

# Remove the installer
Remove-Item -Path "AzureCLI.msi"

# Install Bicep
# Define the path where the Bicep CLI will be installed
$installPath = "C:\bicep\bicep.exe"

# Create the directory if it doesn't exist
New-Item -ItemType Directory -Force -Path "C:\bicep"

# Download the Bicep CLI
Invoke-WebRequest -Uri "https://github.com/Azure/bicep/releases/latest/download/bicep-win-x64.exe" -OutFile $installPath

# Add the Bicep CLI to the PATH
$env:Path += ";C:\bicep"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)

# Install Git
$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/Git-2.33.0.2-64-bit.exe"

# Define the path where the installer will be downloaded
$gitFile = "$env:TEMP\gitinstall.exe"

# Download the installer
Invoke-WebRequest -Uri $gitUrl -OutFile $gitFile

# Install Git with default settings
Start-Process -FilePath $gitFile -Args "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /NOICONS /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\"" -Wait

# Remove the installer
Remove-Item $gitFile




