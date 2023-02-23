function Update-Environment-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function Push-User-Path($userPath) {
    $path = [Environment]::GetEnvironmentVariable('Path', 'User')
    $newpath = "$userPath;$path"
    [Environment]::SetEnvironmentVariable("Path", $newpath, 'User')
    Update-Environment-Path
}


# Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Update-Environment-Path

# Utils
Get-Command -Module Microsoft.PowerShell.Archive

# Git
choco install git --yes --params '/GitAndUnixToolsOnPath'
# choco install tortoisegit --yes
Update-Environment-Path

# UnityHub
choco install unity-hub
Update-Environment-Path

# Unity Tooling
Install-Module UnitySetup -Scope CurrentUser

# Unity Editor
Install-UnitySetupInstance -Installers(Find-UnitySetupInstaller -Version '2021.3.19f1' -Component 'linux')

# WSL
#dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
#dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
#wsl --set-default-version 2 
#wsl --install -d Ubuntu-20.04

# Vagrant and Virtualbox
choco install virtualbox --yes
choco install vagrant --yes

# Other tools
choco install microsoft-windows-terminal --yes
choco install visualstudiocode --yes
Update-Environment-Path

# Pull Repos
git clone git@github.com:Unity-Technologies/edge-simulation-engine.git
git clone git@github.com:NextCenturyCorporation/edge-ui.git

# Run Vagrant
vagrant plugin install vagrant-vbguest
vagrant up


