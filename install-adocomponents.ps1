# Disable Enhanced Internet Explorer Security Configuration
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}' -Name 'IsInstalled' -Value 0

# Install PowerShell Core
iex "& { $(irm https://aka.ms/install-powershell.ps1) }"

# Install Az PowerShell Module
Install-Module -Name Az -AllowClobber -Scope CurrentUser

# Install Az CLI
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

# Install Git
$gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/Git-2.33.0.2-64-bit.exe"
$gitFile = "$env:TEMP\gitinstall.exe"
Invoke-WebRequest -Uri $gitUrl -OutFile $gitFile
Start-Process -FilePath $gitFile -Args "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /NOICONS /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\"" -Wait
Remove-Item $gitFile

# Install Bicep
$installPath = "C:\bicep\bicep.exe"
New-Item -ItemType Directory -Force -Path "C:\bicep"
Invoke-WebRequest -Uri https://github.com/Azure/bicep/releases/latest/download/bicep-win-x64.exe -OutFile $installPath
# Add bicep to PATH
$env:Path += ";C:\bicep"
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)